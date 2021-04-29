-- drop all content
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE abrechnung;
TRUNCATE TABLE abrechnung_position;
TRUNCATE TABLE abwesenheit;
TRUNCATE TABLE abwesenheit_typ;
TRUNCATE TABLE adresse;
TRUNCATE TABLE angehoerige;
TRUNCATE TABLE fuhrpark;
TRUNCATE TABLE hausbesuch;
TRUNCATE TABLE hausbesuch_bewertung;
TRUNCATE TABLE hausbesuch_leistung;
TRUNCATE TABLE kostentraeger;
TRUNCATE TABLE krankenkasse;
TRUNCATE TABLE leistungskomplex;
TRUNCATE TABLE leistungskomplex_position;
TRUNCATE TABLE mitarbeiter;
TRUNCATE TABLE patient;
TRUNCATE TABLE person;
TRUNCATE TABLE pflegesachleistung;
TRUNCATE TABLE tourenplan;
TRUNCATE TABLE vertrag_leistung;

SET FOREIGN_KEY_CHECKS = 1;

-- INSERT ADRESSES

INSERT INTO `adresse` VALUES(0, 'Heimberg', 42503, 'Hohe Strasse', '12');
INSERT INTO `adresse` VALUES(1, 'Astel', 42502, 'Am Stein', '24');
INSERT INTO `adresse` VALUES(2, 'Heimberg', 42503, 'Bergischer Weg', '30');
INSERT INTO `adresse` VALUES(3, 'Heimberg', 42503, 'Am Kiesbett', '25');
INSERT INTO `adresse` VALUES(4, 'Heimberg', 42503, 'Bergischer Weg', '22');
INSERT INTO `adresse` VALUES(5, 'Astel', 42502, 'Neue Strasse', '10');
INSERT INTO `adresse` VALUES(6, 'Gennburg', 42512, 'Heerdorfer Weg', '1');
INSERT INTO `adresse` VALUES(7, 'Heimberg', 42503, 'Bergischer Weg', '12');
INSERT INTO `adresse` VALUES(8, 'Stuggen', 42534, 'Im Neubaugebiet', '64');
INSERT INTO `adresse` VALUES(9, 'Stuggen', 42534, 'In der Reine', '1');
INSERT INTO `adresse` VALUES(10, 'Heimberg', 42503, 'Schöngärtner Landstrasse', '5');
INSERT INTO `adresse` VALUES(11, 'Groß-Gerau', 42512, 'Berner Landweg', '4');
INSERT INTO `adresse` VALUES(12, 'Groß-Gerau', 42512, 'Kleiner Weg', '6');
INSERT INTO `adresse` VALUES(13, 'Heimberg', 42503, 'Bergischer Weg', '1');
INSERT INTO `adresse` VALUES(14, 'Gebbendorf', 15402, 'Im Schacht', '12a');
INSERT INTO `adresse` VALUES(15, 'Ankerford', 24067, 'Neben der Spur', '2');
INSERT INTO `adresse` VALUES(16, 'Rosingen', 52309, 'Im Stadl', '2c');
INSERT INTO `adresse` VALUES(17, 'Heimberg', 42503, 'Heininger Straße', '122');
INSERT INTO `adresse` VALUES(18, 'Heimberg', 42503, 'Lindtal', '100');
INSERT INTO `adresse` VALUES(19, 'Steinberg', 30045, 'Allenbachweg', '9');
INSERT INTO `adresse` VALUES(20, 'Frankenbach', 40050, 'Frankenbachweg', '9');
INSERT INTO `adresse` VALUES(21, 'Steinberg', 30045, 'Allenbachweg', 10);


-- INSERT PERSONS
INSERT INTO `person` VALUES(0, 0, 'Maria', 'Hansen', '0157545123'); 
INSERT INTO `person` VALUES(1, 1, 'Gabriel', 'Marquez', '0126733659');
INSERT INTO `person` VALUES(2, 2, 'Leonardo', 'Fernandez', '01575228342');
INSERT INTO `person` VALUES(3, 3, 'Bernd', 'Röger', '01606624570');
INSERT INTO `person` VALUES(4, 4, 'Schorsch', 'Bennemann', '0178134765');
INSERT INTO `person` VALUES(5, 5, 'Lea', 'Reiser', '0165393435');
INSERT INTO `person` VALUES(6, 6, 'Olaf', 'Löwenbert', '01785534634');
INSERT INTO `person` VALUES(7, 7, 'Mia', 'Munter', '0140245366');
INSERT INTO `person` VALUES(8, 8, 'Stephen', 'Pappé-Leon Ferres', '05433/234333');
INSERT INTO `person` VALUES(9, 9, 'Eliza', 'Bane', '0155699430');
INSERT INTO `person` VALUES(10, 10, 'Stefan', 'Tröpfchen', '0189493922');
INSERT INTO `person` VALUES(11, 5, 'Donald Cedric', 'Franken', '01402456555');
INSERT INTO `person` VALUES(12, 11, 'Leopold', 'Ustinov', '02751/40051');
INSERT INTO `person` VALUES(13, 12, 'Hans', 'Meier', '0196790023');
INSERT INTO `person` VALUES(14, 13, 'Gerhard', 'Loewi', '017813434333');
INSERT INTO `person` VALUES(15, 12, 'Lena', 'Gerber', '0150332100');
INSERT INTO `person` VALUES(16, 8, 'Chris', 'Schildi', '05433/809001');
INSERT INTO `person` VALUES(17, 14, 'Wiegald', 'Buschstädter', '0189495060');
INSERT INTO `person` VALUES(18, 15, 'Alfonse', 'Sur-La-Ponte', '015003000');
INSERT INTO `person` VALUES(19, 16, 'Kasimir', 'Tischler', '02653/3445');
INSERT INTO `person` VALUES(20, 21, 'Bernd', 'Olafson', '014564545335');


-- INSERT MITARBEITER
INSERT INTO `mitarbeiter` VALUES(0,0, '2018-02-10', 'Altenpfleger', 700.0, NULL);
INSERT INTO `mitarbeiter` VALUES(1,1, '2007-01-11', 'Pflegefachkraft', 800.50, NULL);
INSERT INTO `mitarbeiter` VALUES(2,2, '2020-10-22', 'Pflegehelfer', 650.43, NULL);
INSERT INTO `mitarbeiter` VALUES(3,3, '2020-10-22', 'Pflegefachkraft', 923.70, NULL);
INSERT INTO `mitarbeiter` VALUES(4,20,'20-10-25','Pflegehelfer', 600.00, NULL);


-- INSERT KOSTENTRAEGER
INSERT INTO `kostentraeger` VALUES(0); -- kassen
INSERT INTO `kostentraeger` VALUES(1);
INSERT INTO `kostentraeger` VALUES(2);
INSERT INTO `kostentraeger` VALUES(3);
INSERT INTO `kostentraeger` VALUES(4); -- patienten
INSERT INTO `kostentraeger` VALUES(5);
INSERT INTO `kostentraeger` VALUES(6);
INSERT INTO `kostentraeger` VALUES(7);
INSERT INTO `kostentraeger` VALUES(8);
INSERT INTO `kostentraeger` VALUES(9);
INSERT INTO `kostentraeger` VALUES(10);
INSERT INTO `kostentraeger` VALUES(11);
INSERT INTO `kostentraeger` VALUES(12);
INSERT INTO `kostentraeger` VALUES(13);
INSERT INTO `kostentraeger` VALUES(14);


-- INSERT KRANKENKASSE
INSERT INTO `krankenkasse` VALUES(0,17,0, 'AOK Heimberg','Gesetzlich');
INSERT INTO `krankenkasse` VALUES(1,19,1, 'Loewenkasse','Privat');
INSERT INTO `krankenkasse` VALUES(2,18,2, 'BARMER Heimberg','Gesetzlich');
INSERT INTO `krankenkasse` VALUES(3,20,3, 'Gothaer','Gesetzlich');


-- INSERT PATIENTS 
INSERT INTO `patient` VALUES(0,4,4,0,'2');
INSERT INTO `patient` VALUES(1,5,5,0,'1');
INSERT INTO `patient` VALUES(2,6,6,1,'0');
INSERT INTO `patient` VALUES(3,7,7,1,'5');
INSERT INTO `patient` VALUES(4,8,8,3,'2');
INSERT INTO `patient` VALUES(5,9,8,0,'2');
INSERT INTO `patient` VALUES(6,10,10,2,'1');
INSERT INTO `patient` VALUES(7,11,11,1,'3');
INSERT INTO `patient` VALUES(8,12,12,2,'2');
INSERT INTO `patient` VALUES(9,13,13,0,'2');
INSERT INTO `patient` VALUES(10,14,14,3,'0');


-- INSERT PFLEGESACHLEISTUNG
INSERT INTO `pflegesachleistung` VALUES(0,'Anamnese');
INSERT INTO `pflegesachleistung` VALUES(1,'Pflegeplanung');
INSERT INTO `pflegesachleistung` VALUES(2,'Beratung bei der Auswahl der Leistungskomplexe und der sich daraus ergebenden Kosten');
INSERT INTO `pflegesachleistung` VALUES(3,'Information über weitere Hilfen');
INSERT INTO `pflegesachleistung` VALUES(4,'Beratung über Inhalt und Abschluss eines Pflegevertrags');
INSERT INTO `pflegesachleistung` VALUES(5,'An-/Auskleiden');
INSERT INTO `pflegesachleistung` VALUES(6,'Teilwaschen');
INSERT INTO `pflegesachleistung` VALUES(7,'Mund-/Zahnpflege');
INSERT INTO `pflegesachleistung` VALUES(8,'Kämmen/Rasieren');
INSERT INTO `pflegesachleistung` VALUES(9,'Hilfe beim Aufsuchen oder Verlassen des Bettes');
INSERT INTO `pflegesachleistung` VALUES(10,'Waschen (Ganzkörperwaschung)/Duschen/Baden');
INSERT INTO `pflegesachleistung` VALUES(11,'Spezielle Lagerungsmaßnahmen');
INSERT INTO `pflegesachleistung` VALUES(12,'Mundgerechtes Zubereiten der Nahrung');
INSERT INTO `pflegesachleistung` VALUES(13,'Hilfen beim Essen und Trinken/Hauptmahlzeit');
INSERT INTO `pflegesachleistung` VALUES(14,'Hygiene im Zusammenhang mit der Nahrungsaufnahme');
INSERT INTO `pflegesachleistung` VALUES(15,'Spülen des Essgeschirrs');
INSERT INTO `pflegesachleistung` VALUES(16,'Hilfen beim Essen und Trinken/sonstige Mahlzeit');
INSERT INTO `pflegesachleistung` VALUES(17,'Aufbereitung der Sondennahrung');
INSERT INTO `pflegesachleistung` VALUES(18,'Transfer');
INSERT INTO `pflegesachleistung` VALUES(19,'Sachgerechte Verabreichung');
INSERT INTO `pflegesachleistung` VALUES(20,'Säuberung');
INSERT INTO `pflegesachleistung` VALUES(21,'Teilwaschen (Intimtoilette)');
INSERT INTO `pflegesachleistung` VALUES(22,'Hilfe beim Aufstehen');
INSERT INTO `pflegesachleistung` VALUES(23,'Hilfen/Unterstützung bei Ausscheidungen');
INSERT INTO `pflegesachleistung` VALUES(24,'Hilfestellung beim Verlassen und Wiederaufsuchen der Wohnung');
INSERT INTO `pflegesachleistung` VALUES(25,'Begleitung bei Aktivitäten, bei denen das persönliche Erscheinen erforderlich und ein Hausbesuch nicht möglich ist');
INSERT INTO `pflegesachleistung` VALUES(26,'Beschaffung des Heizmaterials und Entsorgung der Verbrennungsrückstände');
INSERT INTO `pflegesachleistung` VALUES(27,'Heizen');
INSERT INTO `pflegesachleistung` VALUES(28,'Reinigen des allgemein üblichen Lebensbereichs');
INSERT INTO `pflegesachleistung` VALUES(29,'Trennung und Entsorgung des Abfalls');
INSERT INTO `pflegesachleistung` VALUES(30,'Wechseln der Wäsche');
INSERT INTO `pflegesachleistung` VALUES(31,'Waschen/Pflege der Wäsche und Kleidung');
INSERT INTO `pflegesachleistung` VALUES(32,'Einräumen der Wäsche');
INSERT INTO `pflegesachleistung` VALUES(33,'vollständiges Ab- und Beziehen des Bettes');
INSERT INTO `pflegesachleistung` VALUES(34,'Erstellen eines Einkaufs- und Speiseplans');
INSERT INTO `pflegesachleistung` VALUES(35,'Einkaufen von Lebensmitteln und sonstigen notwendigen Bedarfsgegenständen');
INSERT INTO `pflegesachleistung` VALUES(36,'Unterbringen der eingekauften Gegenstände');
INSERT INTO `pflegesachleistung` VALUES(37,'Kleine Besorgung in der Nähe der Wohnung des Pflegebedürftigen');
INSERT INTO `pflegesachleistung` VALUES(38,'Unterbringen der eingekauften Gegenstände');
INSERT INTO `pflegesachleistung` VALUES(39,'Kochen der Mahlzeit');
INSERT INTO `pflegesachleistung` VALUES(40,'mundgerechtes Zubereiten der Nahrung');
INSERT INTO `pflegesachleistung` VALUES(41,'Reinigen des Arbeitsbereichs');
INSERT INTO `pflegesachleistung` VALUES(42,'Spülen des Kochgeschirrs');
INSERT INTO `pflegesachleistung` VALUES(43,'Zubereiten einer sonstigen Mahlzeit');
INSERT INTO `pflegesachleistung` VALUES(44,'Beratung');
INSERT INTO `pflegesachleistung` VALUES(45,'Hilfestellung');
INSERT INTO `pflegesachleistung` VALUES(46,'Mitteilung an die Pflegekasse');


-- INSERT LEISTUNGSKOMPLEX
INSERT INTO `leistungskomplex` VALUES(0,'Erstbesuch',1200,49.2,90);
INSERT INTO `leistungskomplex` VALUES(1,'Folgebesuch bei wesentlichen Änderungen',710,49.11,60);
INSERT INTO `leistungskomplex` VALUES(2, 'Kleine Morgen-/Abendtoilette I',185,17.58,30);
INSERT INTO `leistungskomplex` VALUES(3, 'Kleine Morgen-/Abendtoilette II',206,18.44,35);
INSERT INTO `leistungskomplex` VALUES(4, 'Kleine Morgen-/Abendtoilette III', 258,14.57,50);
INSERT INTO `leistungskomplex` VALUES(5, 'Große Morgen-/Abendtoilette I', 350,14.35,40);
INSERT INTO `leistungskomplex` VALUES(6, 'Große Morgen-/Abendtoilette II', 412,16.89,45);
INSERT INTO `leistungskomplex` VALUES(7, 'Große Morgen-/Abendtoilette III', 464,29.02,60);
INSERT INTO `leistungskomplex` VALUES(8,'Spezielle Lagerung bei Bettlägerigkeit oder Immobilität I', 103,14.22,30);
INSERT INTO `leistungskomplex` VALUES(9,'Spezielle Lagerung bei Bettlägerigkeit oder Immobilität II', 155,16.35,30);
INSERT INTO `leistungskomplex` VALUES(10, 'Hilfe bei Nahrungsaufnahme - Hauptmahlzeit', 258,19.57,50);
INSERT INTO `leistungskomplex` VALUES(11, 'Hilfe bei Nahrungsaufnahme - sonstige Mahlzeit', 103,4.32,40);
INSERT INTO `leistungskomplex` VALUES(12, 'Sonderernährung bei implantierter Magensonde (PEG)', 155,6.35,35);
INSERT INTO `leistungskomplex` VALUES(13, 'Erweiterte Hilfe/Unterstützung bei Ausscheidungen I', 103,24.22,20);
INSERT INTO `leistungskomplex` VALUES(14, 'Erweiterte Hilfe/Unterstützung bei Ausscheidungen II', 155,16.35,24);
INSERT INTO `leistungskomplex` VALUES(15, 'Kleine zusätzliche Hilfen/Unterstützung bei Ausscheidungen', 41,11.68,15);
INSERT INTO `leistungskomplex` VALUES(16, 'Hilfestellung bei Verlassen und Wiederaufsuchen der Wohnung', 72,21.95,20);
INSERT INTO `leistungskomplex` VALUES(17, 'Begleitung bei Aktivitäten', 618,10.73,120);
INSERT INTO `leistungskomplex` VALUES(18, 'Beheizen der Wohnung (Ofenheizung)', 90,31.69,20);
INSERT INTO `leistungskomplex` VALUES(19, 'Reinigung der Wohnung', 90,3.69,90);
INSERT INTO `leistungskomplex` VALUES(20, 'Waschen/Pflege der Wäsche und Kleidung', 360,14.76,90);
INSERT INTO `leistungskomplex` VALUES(21, 'Wechseln der Bettwäsche', 50,21.05,20);
INSERT INTO `leistungskomplex` VALUES(22, 'Vorratseinkauf', 150,26.15,90);
INSERT INTO `leistungskomplex` VALUES(23, 'Besorgung', 90,3.69,45);
INSERT INTO `leistungskomplex` VALUES(24, 'Zubereitung einer Hauptmahlzeit', 270,11.07,110);
INSERT INTO `leistungskomplex` VALUES(25, 'Zubereitung einer sonst. Mahlzeit', 70,12.87,50);
INSERT INTO `leistungskomplex` VALUES(26, 'Pflegeeinsatz gem. § 37. Abs. 3 SGB XI',100,14.10,60);
INSERT INTO `leistungskomplex` VALUES(27, 'Pflegerische Betreuungsmaßnahmen', 150,16.15,90);


-- INSERT FUHRPARK
INSERT INTO `fuhrpark` VALUES(0, 'Renault Clio', 'HB-PF-199','2000-10-01',28002.3);
INSERT INTO `fuhrpark` VALUES(1, 'Renault Clio', 'HB-PF-198', '2000-10-02', 35030.45);
INSERT INTO `fuhrpark` VALUES(2, 'Renault Twingo', 'HB-PF-197', '2000-10-02', 45321.32);
INSERT INTO `fuhrpark` VALUES(3, 'Dacia Duster', 'HB-PF-196', '2005-06-25', 32190.45);
INSERT INTO `fuhrpark` VALUES(4, 'VW Loewi', 'HB-PF-195', '2005-06-25', 452334.23);


-- INSERT ANGEHOERIGE person
INSERT `angehoerige` VALUES(10,16);
INSERT `angehoerige` VALUES(8,17);
INSERT `angehoerige` VALUES(6,18);
INSERT `angehoerige` VALUES(4,19);
INSERT `angehoerige` VALUES(5,11);
INSERT `angehoerige` VALUES(10,2);



-- INSERT ABWESENHEIT_TYP
INSERT INTO `abwesenheit_typ` VALUES(0,'Urlaub');
INSERT INTO `abwesenheit_typ` VALUES(1,'Krank');
INSERT INTO `abwesenheit_typ` VALUES(2,'Feiertag');
INSERT INTO `abwesenheit_typ` VALUES(3,'Wochenende');


-- INSERT ABWESENHEIT
INSERT INTO `abwesenheit` VALUES(3,'2021-01-13',0);
INSERT INTO `abwesenheit` VALUES(3,'2021-01-15',1);
INSERT INTO `abwesenheit` VALUES(1,'2021-01-18',0);
INSERT INTO `abwesenheit` VALUES(2,'2021-01-19',1);
INSERT INTO `abwesenheit` VALUES(4,'2021-01-13',0);
INSERT INTO `abwesenheit` VALUES(4,'2021-01-14',0);
INSERT INTO `abwesenheit` VALUES(4,'2021-01-15',0);
INSERT INTO `abwesenheit` VALUES(4,'2021-01-16',0);
INSERT INTO `abwesenheit` VALUES(4,'2021-01-17',0);
INSERT INTO `abwesenheit` VALUES(4,'2021-01-18',3);
INSERT INTO `abwesenheit` VALUES(4,'2021-01-19',3);



-- INSERT TOURENPLAN
INSERT INTO `tourenplan` VALUES(0,'2021-01-13',0,0);
INSERT INTO `tourenplan` VALUES(1,'2021-01-13',1,1);
INSERT INTO `tourenplan` VALUES(2,'2021-01-13',1,1);
INSERT INTO `tourenplan` VALUES(3,'2021-01-13',2,2);
INSERT INTO `tourenplan` VALUES(4,'2021-01-13',2,2);
INSERT INTO `tourenplan` VALUES(5,'2021-01-13',2,2);
INSERT INTO `tourenplan` VALUES(6,'2021-01-13',0,1);
INSERT INTO `tourenplan` VALUES(7,'2021-01-14',0,1);
INSERT INTO `tourenplan` VALUES(8,'2021-01-14',1,0);
INSERT INTO `tourenplan` VALUES(9,'2021-01-14',2,4);
INSERT INTO `tourenplan` VALUES(10,'2021-01-14',3,3);
INSERT INTO `tourenplan` VALUES(11,'2021-01-14',0,1);
INSERT INTO `tourenplan` VALUES(12,'2021-01-15',0,3);
INSERT INTO `tourenplan` VALUES(13,'2021-01-15',0,3);
INSERT INTO `tourenplan` VALUES(14,'2021-01-15',1,1);
INSERT INTO `tourenplan` VALUES(15,'2021-01-15',1,1);
INSERT INTO `tourenplan` VALUES(16,'2021-01-15',2,3);
INSERT INTO `tourenplan` VALUES(17,'2021-01-15',2,4);
INSERT INTO `tourenplan` VALUES(18,'2021-01-16',0,1);
INSERT INTO `tourenplan` VALUES(19,'2021-01-16',1,0);
INSERT INTO `tourenplan` VALUES(20,'2021-01-16',2,3);
INSERT INTO `tourenplan` VALUES(21,'2021-01-16',2,3);
INSERT INTO `tourenplan` VALUES(22,'2021-01-16',3,2);
INSERT INTO `tourenplan` VALUES(23,'2021-01-16',3,2);
INSERT INTO `tourenplan` VALUES(24,'2021-01-17',0,1);
INSERT INTO `tourenplan` VALUES(25,'2021-01-17',1,2);
INSERT INTO `tourenplan` VALUES(26,'2021-01-17',2,3);
INSERT INTO `tourenplan` VALUES(27,'2021-01-17',3,4);
INSERT INTO `tourenplan` VALUES(28,'2021-01-17',3,4);
INSERT INTO `tourenplan` VALUES(29,'2021-01-18',0,1);
INSERT INTO `tourenplan` VALUES(30,'2021-01-18',0,1);
INSERT INTO `tourenplan` VALUES(31,'2021-01-18',2,2);
INSERT INTO `tourenplan` VALUES(32,'2021-01-18',3,3);
INSERT INTO `tourenplan` VALUES(33,'2021-01-18',3,3);
INSERT INTO `tourenplan` VALUES(34,'2021-01-19',0,1);
INSERT INTO `tourenplan` VALUES(35,'2021-01-19',0,1);
INSERT INTO `tourenplan` VALUES(36,'2021-01-19',1,2);
INSERT INTO `tourenplan` VALUES(37,'2021-01-19',3,4);
INSERT INTO `tourenplan` VALUES(38,'2021-01-19',3,4);
INSERT INTO `tourenplan` VALUES(39,'2021-01-19',0,3);




-- INSERT HAUSBESUCH
INSERT INTO `hausbesuch` VALUES(0,0,0,'08:00:00');
INSERT INTO `hausbesuch` VALUES(1,0,1,'10:00:00');
INSERT INTO `hausbesuch` VALUES(2,0,2,'12:00:00');
INSERT INTO `hausbesuch` VALUES(3,1,3,'08:30:00');
INSERT INTO `hausbesuch` VALUES(4,2,4,'07:00:00');
INSERT INTO `hausbesuch` VALUES(5,3,5,'11:00:00');
INSERT INTO `hausbesuch` VALUES(6,3,6,'13:00:00');
INSERT INTO `hausbesuch` VALUES(7,4,7,'17:00:00');
INSERT INTO `hausbesuch` VALUES(8,5,8,'18:30:00');
INSERT INTO `hausbesuch` VALUES(9,6,9,'15:00:00');
INSERT INTO `hausbesuch` VALUES(10,6,10,'16:00:00');
INSERT INTO `hausbesuch` VALUES(11,7,0,'07:00:00');
INSERT INTO `hausbesuch` VALUES(12,7,1,'08:00:00');
INSERT INTO `hausbesuch` VALUES(13,8,2,'09:00:00');
INSERT INTO `hausbesuch` VALUES(14,8,3,'10:00:00');
INSERT INTO `hausbesuch` VALUES(15,8,4,'11:00:00');
INSERT INTO `hausbesuch` VALUES(16,9,5,'10:20:00');
INSERT INTO `hausbesuch` VALUES(17,9,6,'11:30:00');
INSERT INTO `hausbesuch` VALUES(18,9,7,'13:00:00');
INSERT INTO `hausbesuch` VALUES(19,10,8,'11:00:00');
INSERT INTO `hausbesuch` VALUES(20,10,9,'12:00:00');
INSERT INTO `hausbesuch` VALUES(21,11,10,'18:55:00');
INSERT INTO `hausbesuch` VALUES(22,12,0,'08:00:00');
INSERT INTO `hausbesuch` VALUES(23,12,1,'09:00:00');
INSERT INTO `hausbesuch` VALUES(24,13,2,'12:00:00');
INSERT INTO `hausbesuch` VALUES(25,13,3,'13:00:00');
INSERT INTO `hausbesuch` VALUES(26,14,4,'08:00:00');
INSERT INTO `hausbesuch` VALUES(27,14,5,'09:30:00');
INSERT INTO `hausbesuch` VALUES(28,14,6,'11:00:00');
INSERT INTO `hausbesuch` VALUES(29,15,7,'18:00:00');
INSERT INTO `hausbesuch` VALUES(30,16,8,'08:00:00');
INSERT INTO `hausbesuch` VALUES(31,16,9,'09:00:00');
INSERT INTO `hausbesuch` VALUES(32,17,10,'15:00:00');
INSERT INTO `hausbesuch` VALUES(33,18,0,'08:00:00');
INSERT INTO `hausbesuch` VALUES(34,18,1,'09:00:00');
INSERT INTO `hausbesuch` VALUES(35,18,2,'10:00:00');
INSERT INTO `hausbesuch` VALUES(36,19,3,'07:00:00');
INSERT INTO `hausbesuch` VALUES(37,19,4,'08:00:00');
INSERT INTO `hausbesuch` VALUES(38,20,5,'08:00:00');
INSERT INTO `hausbesuch` VALUES(39,20,6,'09:50:00');
INSERT INTO `hausbesuch` VALUES(40,21,7,'13:00:00');
INSERT INTO `hausbesuch` VALUES(41,21,8,'14:00:00');
INSERT INTO `hausbesuch` VALUES(42,22,9,'08:00:00');
INSERT INTO `hausbesuch` VALUES(43,23,10,'17:00:00');
INSERT INTO `hausbesuch` VALUES(44,24,0,'08:00:00');
INSERT INTO `hausbesuch` VALUES(45,24,1,'09:00:00');
INSERT INTO `hausbesuch` VALUES(46,25,2,'08:00:00');
INSERT INTO `hausbesuch` VALUES(47,25,3,'09:00:00');
INSERT INTO `hausbesuch` VALUES(48,25,4,'10:00:00');
INSERT INTO `hausbesuch` VALUES(49,26,5,'08:00:00');
INSERT INTO `hausbesuch` VALUES(50,26,6,'09:00:00');
INSERT INTO `hausbesuch` VALUES(51,27,7,'08:00:00');
INSERT INTO `hausbesuch` VALUES(52,27,8,'10:00:00');
INSERT INTO `hausbesuch` VALUES(53,28,9,'14:00:00');
INSERT INTO `hausbesuch` VALUES(54,28,10,'15:00:00');
INSERT INTO `hausbesuch` VALUES(55,29,0,'08:00:00');
INSERT INTO `hausbesuch` VALUES(56,29,1,'09:00:00');
INSERT INTO `hausbesuch` VALUES(57,29,2,'10:00:00');
INSERT INTO `hausbesuch` VALUES(58,30,3,'17:00:00');
INSERT INTO `hausbesuch` VALUES(59,31,4,'08:00:00');
INSERT INTO `hausbesuch` VALUES(60,31,5,'09:00:00');
INSERT INTO `hausbesuch` VALUES(61,31,6,'10:00:00');
INSERT INTO `hausbesuch` VALUES(62,32,7,'08:00:00');
INSERT INTO `hausbesuch` VALUES(63,32,8,'09:00:00');
INSERT INTO `hausbesuch` VALUES(64,33,9,'14:00:00');
INSERT INTO `hausbesuch` VALUES(65,33,10,'15:30:00');
INSERT INTO `hausbesuch` VALUES(66,34,0,'08:00:00');
INSERT INTO `hausbesuch` VALUES(67,34,1,'09:00:00');
INSERT INTO `hausbesuch` VALUES(68,35,2,'15:00:00');
INSERT INTO `hausbesuch` VALUES(69,36,3,'08:00:00');
INSERT INTO `hausbesuch` VALUES(70,36,4,'09:00:00');
INSERT INTO `hausbesuch` VALUES(71,37,5,'08:00:00');
INSERT INTO `hausbesuch` VALUES(72,37,6,'09:00:00');
INSERT INTO `hausbesuch` VALUES(73,37,7,'10:00:00');
INSERT INTO `hausbesuch` VALUES(74,38,8,'15:00:00');
INSERT INTO `hausbesuch` VALUES(75,39,9,'17:00:00');
INSERT INTO `hausbesuch` VALUES(76,39,10,'18:00:00');




-- INSERT VERTRAG_LEISTUNG
INSERT INTO `vertrag_leistung` VALUES(0,7,7);
INSERT INTO `vertrag_leistung` VALUES(0,1,1);
INSERT INTO `vertrag_leistung` VALUES(0,24,7);
INSERT INTO `vertrag_leistung` VALUES(0,25,7);
INSERT INTO `vertrag_leistung` VALUES(1,2,7);
INSERT INTO `vertrag_leistung` VALUES(1,24,4);
INSERT INTO `vertrag_leistung` VALUES(1,22,2);
INSERT INTO `vertrag_leistung` VALUES(1,23,1);
INSERT INTO `vertrag_leistung` VALUES(1,19,1);
INSERT INTO `vertrag_leistung` VALUES(1,10,7);
INSERT INTO `vertrag_leistung` VALUES(2,6,6);
INSERT INTO `vertrag_leistung` VALUES(2,10,5);
INSERT INTO `vertrag_leistung` VALUES(2,11,3);
INSERT INTO `vertrag_leistung` VALUES(3,7,5);
INSERT INTO `vertrag_leistung` VALUES(3,10,4);
INSERT INTO `vertrag_leistung` VALUES(3,19,2);
INSERT INTO `vertrag_leistung` VALUES(4,7,4);
INSERT INTO `vertrag_leistung` VALUES(4,10,3);
INSERT INTO `vertrag_leistung` VALUES(4,15,7);
INSERT INTO `vertrag_leistung` VALUES(5,7,7);
INSERT INTO `vertrag_leistung` VALUES(5,10,5);
INSERT INTO `vertrag_leistung` VALUES(5,9,7);
INSERT INTO `vertrag_leistung` VALUES(6,3,6);
INSERT INTO `vertrag_leistung` VALUES(6,11,7);
INSERT INTO `vertrag_leistung` VALUES(6,23,4);
INSERT INTO `vertrag_leistung` VALUES(7,3,5);
INSERT INTO `vertrag_leistung` VALUES(7,22,2);
INSERT INTO `vertrag_leistung` VALUES(7,24,2);
INSERT INTO `vertrag_leistung` VALUES(8,24,7);
INSERT INTO `vertrag_leistung` VALUES(8,18,7);
INSERT INTO `vertrag_leistung` VALUES(8,7,7);
INSERT INTO `vertrag_leistung` VALUES(8,21,2);
INSERT INTO `vertrag_leistung` VALUES(9,7,7);
INSERT INTO `vertrag_leistung` VALUES(9,27,2);
INSERT INTO `vertrag_leistung` VALUES(9,15,4);
INSERT INTO `vertrag_leistung` VALUES(10,6,7);
INSERT INTO `vertrag_leistung` VALUES(10,16,3);


-- INSERT LEISTUNGSKOMPLEX_POSITION
INSERT INTO `leistungskomplex_position` VALUES(0,0);
INSERT INTO `leistungskomplex_position` VALUES(0,1);
INSERT INTO `leistungskomplex_position` VALUES(0,2);
INSERT INTO `leistungskomplex_position` VALUES(0,3);
INSERT INTO `leistungskomplex_position` VALUES(0,4);
INSERT INTO `leistungskomplex_position` VALUES(1,5);
INSERT INTO `leistungskomplex_position` VALUES(1,6);
INSERT INTO `leistungskomplex_position` VALUES(1,7);
INSERT INTO `leistungskomplex_position` VALUES(2,5);
INSERT INTO `leistungskomplex_position` VALUES(2,6);
INSERT INTO `leistungskomplex_position` VALUES(2,7);
INSERT INTO `leistungskomplex_position` VALUES(2,8);
INSERT INTO `leistungskomplex_position` VALUES(3,9);
INSERT INTO `leistungskomplex_position` VALUES(3,5);
INSERT INTO `leistungskomplex_position` VALUES(3,6);
INSERT INTO `leistungskomplex_position` VALUES(3,7);
INSERT INTO `leistungskomplex_position` VALUES(3,8);
INSERT INTO `leistungskomplex_position` VALUES(4,5);
INSERT INTO `leistungskomplex_position` VALUES(4,10);
INSERT INTO `leistungskomplex_position` VALUES(4,7);
INSERT INTO `leistungskomplex_position` VALUES(5,5);
INSERT INTO `leistungskomplex_position` VALUES(5,10);
INSERT INTO `leistungskomplex_position` VALUES(5,7);
INSERT INTO `leistungskomplex_position` VALUES(5,8);
INSERT INTO `leistungskomplex_position` VALUES(6,9);
INSERT INTO `leistungskomplex_position` VALUES(6,5);
INSERT INTO `leistungskomplex_position` VALUES(6,10);
INSERT INTO `leistungskomplex_position` VALUES(6,7);
INSERT INTO `leistungskomplex_position` VALUES(6,8);
INSERT INTO `leistungskomplex_position` VALUES(7,11);
INSERT INTO `leistungskomplex_position` VALUES(8,12);
INSERT INTO `leistungskomplex_position` VALUES(8,13);
INSERT INTO `leistungskomplex_position` VALUES(8,14);
INSERT INTO `leistungskomplex_position` VALUES(8,15);
INSERT INTO `leistungskomplex_position` VALUES(9,12);
INSERT INTO `leistungskomplex_position` VALUES(9,16);
INSERT INTO `leistungskomplex_position` VALUES(9,14);
INSERT INTO `leistungskomplex_position` VALUES(9,15);
INSERT INTO `leistungskomplex_position` VALUES(10,17);
INSERT INTO `leistungskomplex_position` VALUES(10,18);
INSERT INTO `leistungskomplex_position` VALUES(10,19);
INSERT INTO `leistungskomplex_position` VALUES(10,20);
INSERT INTO `leistungskomplex_position` VALUES(11,5);
INSERT INTO `leistungskomplex_position` VALUES(11,22);
INSERT INTO `leistungskomplex_position` VALUES(11,23);
INSERT INTO `leistungskomplex_position` VALUES(11,21);
INSERT INTO `leistungskomplex_position` VALUES(12,23);
INSERT INTO `leistungskomplex_position` VALUES(12,22);
INSERT INTO `leistungskomplex_position` VALUES(13,5);
INSERT INTO `leistungskomplex_position` VALUES(13,24);
INSERT INTO `leistungskomplex_position` VALUES(14,5);
INSERT INTO `leistungskomplex_position` VALUES(14,24);
INSERT INTO `leistungskomplex_position` VALUES(14,25);
INSERT INTO `leistungskomplex_position` VALUES(15,26);
INSERT INTO `leistungskomplex_position` VALUES(15,27);
INSERT INTO `leistungskomplex_position` VALUES(16,28);
INSERT INTO `leistungskomplex_position` VALUES(16,29);
INSERT INTO `leistungskomplex_position` VALUES(17,30);
INSERT INTO `leistungskomplex_position` VALUES(17,31);
INSERT INTO `leistungskomplex_position` VALUES(17,32);
INSERT INTO `leistungskomplex_position` VALUES(18,33);
INSERT INTO `leistungskomplex_position` VALUES(19,34);
INSERT INTO `leistungskomplex_position` VALUES(19,35);
INSERT INTO `leistungskomplex_position` VALUES(19,36);
INSERT INTO `leistungskomplex_position` VALUES(20,37);
INSERT INTO `leistungskomplex_position` VALUES(20,38);
INSERT INTO `leistungskomplex_position` VALUES(21,39);
INSERT INTO `leistungskomplex_position` VALUES(21,40);
INSERT INTO `leistungskomplex_position` VALUES(21,41);
INSERT INTO `leistungskomplex_position` VALUES(21,42);
INSERT INTO `leistungskomplex_position` VALUES(22,43);
INSERT INTO `leistungskomplex_position` VALUES(22,40);
INSERT INTO `leistungskomplex_position` VALUES(22,41);
INSERT INTO `leistungskomplex_position` VALUES(22,42);
INSERT INTO `leistungskomplex_position` VALUES(23,44);
INSERT INTO `leistungskomplex_position` VALUES(23,45);
INSERT INTO `leistungskomplex_position` VALUES(23,46);


-- INSERT HAUSBESUCH_LEISTUNG
CALL fill_hausbesuch_leistung;

-- Erstelle zufällige Bewertungen
CALL fill_hausbesuch_bewertung;

-- Erstelle Abrechnungen des Zeitraums
CALL create_billings('2021-01-13','2021-01-19');



