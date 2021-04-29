-- 1. Wochenplan des Mitarbeiters namens 'Gabriel Marquez' für die Woche vom '2021-01-13' bis '2021-01-19' mit Arbeitstage und Abwesenheiten
--    unter Angabe der Tournummer, des Datums, Fahrzeugs, Vor- und Nachname des zu behandleten Patienten und der gewählten Behandlung.

SELECT tourenplan.id_tour AS 'TourNr.', datum AS 'Einsatzdatum', hausbesuch.id_hausbesuch AS 'HausbesuchNr', m.patientenname AS 'Name des Patienten', bezeichnung AS 'Leistungskomplex'
FROM tourenplan, mitarbeiter, person, vertrag_leistung, hausbesuch, leistungskomplex, (SELECT patient.id_patient, CONCAT(nachname, ', ', vorname) patientenname
                                                                                       FROM patient, person
                                                                                       WHERE patient.id_person=person.id_person) m
WHERE tourenplan.id_mitarbeiter=mitarbeiter.id_mitarbeiter AND
      mitarbeiter.id_person=person.id_person AND 
      tourenplan.id_tour=hausbesuch.id_tour AND
      hausbesuch.id_patient=vertrag_leistung.id_patient AND
      vertrag_leistung.id_leistungskomplex=leistungskomplex.id_leistungskomplex AND
	  hausbesuch.id_patient = m.id_patient AND
      vorname='Gabriel' AND nachname ='Marquez'
ORDER BY datum, id_hausbesuch;
   
   
   
-- 2. Urlaubsliste für Einsatzplanung der Mitarbeiter mit Datum, Name und Abwesenheitstyp, sortiert Datum
SELECT datum AS 'Datum', CONCAT(nachname, ', ', vorname) AS 'Mitarbeiter', bezeichnung AS 'Vermerk'
FROM abwesenheit_typ, abwesenheit, mitarbeiter, person
WHERE abwesenheit_typ.id_abwesenheit_typ=abwesenheit.id_abwesenheit_typ AND
      abwesenheit.id_mitarbeiter=mitarbeiter.id_mitarbeiter AND
	  mitarbeiter.id_person=person.id_person
ORDER BY datum;



-- 3. Durchgeführte Behandlungen während der Hausbesuche bei Patientin Mia Munter
--    unter Angabe des Datums, der Maßnahme und des ausführenden Mitarbeiters sortiert nach Datum.

-- hausbesuche bei mia munter
SELECT m.mitarbeitername AS 'Name des Mitarbeiters', datum AS 'Datum', bezeichnung AS 'Leistungskomplex'
FROM hausbesuch, patient, person, leistungskomplex, hausbesuch_leistung, tourenplan, (SELECT tourenplan.id_mitarbeiter, CONCAT(nachname, ', ', vorname) AS mitarbeitername
                                                                                      FROM tourenplan, mitarbeiter, person
                                                                                      WHERE tourenplan.id_mitarbeiter=mitarbeiter.id_mitarbeiter AND
																							mitarbeiter.id_person=person.id_person
																					  GROUP BY mitarbeiter.id_mitarbeiter) m
WHERE hausbesuch.id_patient=patient.id_patient AND
      patient.id_person=person.id_person AND 
      hausbesuch.id_hausbesuch=hausbesuch_leistung.id_hausbesuch AND
      hausbesuch_leistung.id_leistungskomplex=leistungskomplex.id_leistungskomplex AND
      tourenplan.id_tour=hausbesuch.id_tour AND
      tourenplan.id_mitarbeiter=m.id_mitarbeiter AND
      (vorname = 'Mia' AND nachname = 'Munter');



-- 4. Adressliste der Patienten mit Angehörigen
SELECT m.pat_name AS 'Name des Patienten', CONCAT(nachname, ', ', vorname) AS 'Name des Angehoerigen', plz, wohnort, strasse, hausnummer, tel
FROM patient, angehoerige, person, adresse, (SELECT patient.id_patient, CONCAT(nachname, ', ', vorname) pat_name
                                             FROM patient, angehoerige, person
                                             WHERE patient.id_patient=angehoerige.id_patient AND
												   patient.id_person=person.id_person
											 GROUP BY patient.id_patient) m
WHERE patient.id_patient=angehoerige.id_patient AND
      angehoerige.id_person=person.id_person AND
      person.id_adresse=adresse.id_adresse AND 
      m.id_patient=angehoerige.id_patient;
      

      


-- 5. Meistgefahrenstes Auto mit Modellname und Anzahl Fahrten, Kennzeichen und Kilometerstand
SELECT m.id_fahrzeug, modell AS 'Meistgefahrenes Fahrzeug', MAX(count) AS 'Anzahl Fahrten', kennzeichen, kilometerstand
FROM (SELECT fuhrpark.id_fahrzeug, COUNT(fuhrpark.id_fahrzeug) count, modell, kennzeichen, kilometerstand
      FROM fuhrpark, tourenplan
	  WHERE fuhrpark.id_fahrzeug=tourenplan.id_fahrzeug
      GROUP BY id_fahrzeug) m;



-- 6. Top 5 der in Hausbesuchen erfolgten Behandlungen und Bottom 5 mit Name, Kosten, Dauer und Anzahl der Anwendungen über alle Hausbesuche
(SELECT bezeichnung, COUNT(hausbesuch_leistung.id_leistungskomplex)
 FROM hausbesuch_leistung, leistungskomplex
 WHERE hausbesuch_leistung.id_leistungskomplex=leistungskomplex.id_leistungskomplex
 GROUP BY hausbesuch_leistung.id_leistungskomplex
 ORDER BY COUNT(hausbesuch_leistung.id_leistungskomplex) DESC
 LIMIT 3)
UNION
(SELECT bezeichnung, COUNT(hausbesuch_leistung.id_leistungskomplex)
 FROM hausbesuch_leistung, leistungskomplex
 WHERE hausbesuch_leistung.id_leistungskomplex=leistungskomplex.id_leistungskomplex
 GROUP BY hausbesuch_leistung.id_leistungskomplex
 ORDER BY COUNT(hausbesuch_leistung.id_leistungskomplex)
 LIMIT 3);
 


-- 7. Liste der Namen privatversicherter Patienten
SELECT CONCAT(nachname, ', ', vorname) AS 'Name des Patienten'
FROM patient, krankenkasse, person
WHERE patient.id_krankenkasse=krankenkasse.id_krankenkasse AND
      patient.id_person=person.id_person AND
      typ='Privat';




-- 8  Liste der Abrechnungen privat versicherter Patienten mit AbrNr, Datum, Name, Pflegegrad und Kosten
SELECT abrechnung.id_abrechnung AS 'AbrNr', datum, CONCAT(nachname, ', ', vorname) AS 'Patient', bezeichnung AS 'Zuständige Kasse', pflegegrad, gesamtkosten
FROM abrechnung, abrechnung_position, hausbesuch, patient, person, krankenkasse
WHERE abrechnung_position.id_hausbesuch=hausbesuch.id_hausbesuch AND
      abrechnung.id_abrechnung=abrechnung_position.id_abrechnung AND
      hausbesuch.id_patient=patient.id_patient AND
      patient.id_person=person.id_person AND
      patient.id_krankenkasse=krankenkasse.id_krankenkasse AND
      typ='Privat'
GROUP BY abrechnung_position.id_abrechnung;


-- 9  Liste der Abrechnungen gesetzlich versicherter Patienten mit AbrNr, Datum, Name, Pflegegrad und Kosten und eventuell anfallendem Eigenanteil, falls Kosten nicht durch Pflegegrad gedeckt XX
SELECT abrechnung.id_abrechnung, CONCAT(nachname, ', ', vorname) patient, pflegegrad, datum, abrechnung.gesamtkosten AS 'Übernommene Kosten', eigenanteil.gesamtkosten AS 'davon Eigenanteil'
FROM abrechnung_position
INNER JOIN abrechnung ON  abrechnung.id_abrechnung = abrechnung_position.id_abrechnung
LEFT JOIN eigenanteil ON eigenanteil.id_abrechnung = abrechnung.id_abrechnung
INNER JOIN hausbesuch ON abrechnung_position.id_hausbesuch = hausbesuch.id_hausbesuch
INNER JOIN patient ON hausbesuch.id_patient = patient.id_patient
INNER JOIN person ON patient.id_person = person.id_person 
INNER JOIN krankenkasse ON patient.id_krankenkasse = krankenkasse.id_krankenkasse
WHERE typ='Gesetzlich'
GROUP BY patient;


-- 10  Erwartete Einkünfte durch Abrechnungen des Monats Januar
SELECT SUM(gesamtkosten) + m.ges AS 'Zu erwartende Einkünfte Januar'
FROM abrechnung, (SELECT SUM(eigenanteil.gesamtkosten) ges
                  FROM eigenanteil, abrechnung
                  WHERE abrechnung.id_abrechnung=eigenanteil.id_abrechnung AND
				  MONTH(datum)='01') m
WHERE MONTH(datum)='01';






