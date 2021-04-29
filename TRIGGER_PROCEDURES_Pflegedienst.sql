DROP TRIGGER IF EXISTS calculate_monthly_rating;
DROP PROCEDURE IF EXISTS create_billings_for_patient;
DROP PROCEDURE IF EXISTS create_billings;
DROP PROCEDURE IF EXISTS fill_hausbesuch_leistung;
DROP PROCEDURE IF EXISTS fill_hausbesuch_bewertung;

-- Berechne Monatsbewertung des jew. Patienten nach Einfügen einer neuen Zeile in hausbesuch_bewertung
DELIMITER |
CREATE TRIGGER calculate_monthly_rating
  AFTER INSERT ON `hausbesuch_bewertung` FOR EACH ROW
    BEGIN
        DECLARE emp INT(10);
        DECLARE mon INT(10);
        DECLARE yr INT(10);
        
        SET emp = NEW.id_mitarbeiter;
        SET mon = MONTH(NEW.datum);
        SET yr = YEAR(NEW.datum);
        
        UPDATE mitarbeiter
        SET monatliches_rating = (SELECT ROUND(SUM(`hausbesuch_bewertung`.bewertung)/COUNT(`hausbesuch_bewertung`.bewertung), 2)
                                 FROM `hausbesuch_bewertung`
                                 WHERE `hausbesuch_bewertung`.id_mitarbeiter=emp AND
                                       MONTH(`hausbesuch_bewertung`.datum)=mon AND
                                       YEAR(`hausbesuch_bewertung`.datum)=yr
                                 GROUP BY `hausbesuch_bewertung`.id_mitarbeiter)
        WHERE mitarbeiter.id_mitarbeiter=emp;
	END; |

DELIMITER |
CREATE PROCEDURE `create_billings`(
  IN date_from DATE,
  IN date_to DATE)
BEGIN
	DECLARE i INT(10);
	DECLARE nRows INT(10);

	SET nRows = (SELECT COUNT(*) FROM patient);
	SET i = 0;
    
	WHILE i<nRows DO
      CALL create_billings_for_patient(i,date_from,date_to);
	  SET  i = i + 1;
	END WHILE;
END; |

-- Erstelle Abrechnungen für Patienten für Zeitraum
DELIMITER |
CREATE PROCEDURE `create_billings_for_patient`(
  IN pat INT(10),
  IN date_from DATE,
  IN date_to DATE)
BEGIN
      DECLARE nRows INT(10);
      DECLARE i INT(10);
      DECLARE sum FLOAT(25);
      DECLARE pflegegrad_anspruch FLOAT(25);
      DECLARE nr INT(10);
      DECLARE nrEigenanteil INT(10);
      DECLARE pgrad ENUM('0','1','2','3','4','5');
	 
      DROP TABLE IF EXISTS tmp;
      CREATE TEMPORARY TABLE tmp(
	    SELECT `hausbesuch`.id_hausbesuch, ROUND(SUM(preis),2) preis
        FROM leistungskomplex, hausbesuch_leistung, hausbesuch, tourenplan
        WHERE `tourenplan`.id_tour=`hausbesuch`.id_tour AND
              `hausbesuch`.id_hausbesuch=`hausbesuch_leistung`.id_hausbesuch AND
              `hausbesuch_leistung`.id_leistungskomplex=`leistungskomplex`.id_leistungskomplex AND
              `tourenplan`.datum BETWEEN date_from AND date_to AND
              `hausbesuch`.id_patient=pat
		GROUP BY hausbesuch.id_hausbesuch
       );
       
       SET nr = (SELECT COUNT(*) FROM abrechnung);
       SET nrEigenanteil = (SELECT COUNT(*) FROM eigenanteil);
       SET nRows = (SELECT COUNT(*) FROM tmp);
       SET i = 0;
              
       -- abrechnung erstellen -> privat oder gesetzlich?
	   IF (SELECT typ FROM patient, krankenkasse WHERE `patient`.id_krankenkasse=`krankenkasse`.id_krankenkasse AND id_patient=pat)='Privat' THEN 
         INSERT INTO `abrechnung` VALUES(nr, (SELECT id_kostentraeger FROM patient WHERE id_patient=pat), CURRENT_DATE(), NULL);
	   ELSE
	     INSERT INTO `abrechnung` VALUES(nr, (SELECT `krankenkasse`.id_kostentraeger FROM patient, krankenkasse WHERE `patient`.id_krankenkasse=`krankenkasse`.id_krankenkasse AND id_patient=pat), CURRENT_DATE(), NULL);
	   END IF;
          
       -- abrechnung positionen erstellen
       WHILE i<nRows DO
         INSERT INTO `abrechnung_position` VALUES(nr, (SELECT id_hausbesuch FROM tmp LIMIT i,1), (SELECT preis FROM tmp LIMIT i,1));
         SET  i = i + 1;
       END WHILE;
       
       SET sum = (SELECT SUM(kosten) FROM `abrechnung_position` WHERE id_abrechnung=nr);
       
       
       -- kosten summieren und ggf. eigenanteil erstellen, abrechnungen updaten
       IF (SELECT typ FROM patient, krankenkasse WHERE `patient`.id_krankenkasse=`krankenkasse`.id_krankenkasse AND id_patient=pat)='Privat' THEN 
         UPDATE `abrechnung` 
           SET `gesamtkosten`= ROUND(sum,2)
           WHERE `id_abrechnung`=nr;
       ELSE
         SET pgrad = (SELECT pflegegrad FROM patient WHERE id_patient=pat);
         IF pgrad='0' THEN 
             SET pflegegrad_anspruch = 0.0;
         ELSEIF pgrad='1' THEN 
             SET pflegegrad_anspruch = 0.0;
         ELSEIF pgrad='2' THEN 
             SET pflegegrad_anspruch = 689.0;
         ELSEIF pgrad='3' THEN
             SET pflegegrad_anspruch = 1289.0;
         ELSEIF pgrad='4' THEN 
             SET pflegegrad_anspruch = 1612.0;
		 ELSE 
             SET pflegegrad_anspruch = 1995.0;
         END IF;
          
		 IF pflegegrad_anspruch=0.0 THEN
		     UPDATE `abrechnung` 
			     SET `gesamtkosten`=ROUND(sum,2)
			     WHERE `id_abrechnung`=nr;
		 ELSE
		     IF sum - pflegegrad_anspruch > 0.0 THEN
			     UPDATE `abrechnung` 
				     SET `gesamtkosten`=pflegegrad_anspruch
				     WHERE `id_abrechnung`=nr;
				 INSERT INTO `eigenanteil` VALUES(nrEigenanteil, nr, ROUND(sum - pflegegrad_anspruch,2), (SELECT id_kostentraeger FROM patient WHERE id_patient=pat));    
			 ELSE
				UPDATE `abrechnung` 
				    SET `gesamtkosten`=ROUND(sum,2)
				    WHERE `id_abrechnung`=nr;
             END IF;
		END IF;
	END IF;
  END; |


-- Fülle hausbesuch_bewertung mit zufälligen Ratings für alle Hausbesuche
DELIMITER |
CREATE PROCEDURE fill_hausbesuch_bewertung()
BEGIN
  DECLARE emp INT(10);
  DECLARE pat INT(10);
  DECLARE dat DATE;
  DECLARE rating INT(10);
  DECLARE nRows INT(10);
  DECLARE i INT(10);
  
  DROP TABLE IF EXISTS tmp_bew;
  CREATE TEMPORARY TABLE tmp_bew(
	SELECT id_mitarbeiter, id_patient, datum
	FROM hausbesuch,tourenplan
	WHERE `hausbesuch`.id_tour=`tourenplan`.id_tour
   );

   SET nRows = (SELECT COUNT(*) FROM tmp_bew);
   SET i = 0;
   
   WHILE i < nRows DO
     SET emp = (SELECT id_mitarbeiter FROM tmp_bew LIMIT i,1);
     SET pat = (SELECT id_patient FROM tmp_bew LIMIT i,1);
     SET dat = (SELECT datum FROM tmp_bew LIMIT i,1);
     SET rating = (SELECT CAST((RAND() * 5) AS UNSIGNED));
	 INSERT INTO `hausbesuch_bewertung` VALUES(emp, pat, dat, rating);
	 SET  i = i + 1;
   END WHILE;
END; |

-- Fülle hausbesuch_leistungen mit vertr. Leistung unter der Annahme, in der Woche seien alle Leistungen erfüllt worden. 


-- GGF ÜBERARBEITEN --

DELIMITER |
CREATE PROCEDURE fill_hausbesuch_leistung()
BEGIN
  DECLARE hid INT(10);
  DECLARE lkid INT(10);
  DECLARE nRows INT(10);
  DECLARE i INT(10);
  
  DROP TABLE IF EXISTS tmp_l;
  CREATE TEMPORARY TABLE tmp_l(
	SELECT id_hausbesuch, id_leistungskomplex
	FROM hausbesuch,vertrag_leistung
	WHERE `hausbesuch`.id_patient=`vertrag_leistung`.id_patient
   );

   SET nRows = (SELECT COUNT(*) FROM tmp_l);
   SET i = 0;
   
   WHILE i < nRows DO
     SET hid = (SELECT id_hausbesuch FROM tmp_l LIMIT i,1);
     SET lkid = (SELECT id_leistungskomplex FROM tmp_l LIMIT i,1);
	 INSERT INTO `hausbesuch_leistung` VALUES(hid, lkid);
	 SET  i = i + 1;
   END WHILE;
END; |