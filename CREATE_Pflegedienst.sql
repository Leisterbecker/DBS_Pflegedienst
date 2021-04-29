-- General info:
-- MYSQL Workbench 8.0.22
--
--   Datenbank: Pflegedienst
--
-- Drop all
SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS pflegedienst;
CREATE DATABASE pflegedienst;
USE pflegedienst;
SET FOREIGN_KEY_CHECKS = 1;


-- Create tables

CREATE TABLE `adresse` (
  `id_adresse` INT(10) NOT NULL,
  `wohnort` VARCHAR(255) NOT NULL,
  `plz` INT(10) NOT NULL,
  `strasse` VARCHAR(255) NOT NULL,
  `hausnummer` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `person` (
  `id_person` INT(10) NOT NULL,
  `id_adresse` INT(10) NOT NULL,
  `vorname` VARCHAR(255) NOT NULL,
  `nachname` VARCHAR(255) NOT NULL,
  `tel` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `kostentraeger` (
  `id_kostentraeger`INT(10) NOT NULL COMMENT 'Als FK fuer Person und Institutionen'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `patient` (
  `id_patient` INT(10) NOT NULL,
  `id_person` INT(10) NOT NULL,
  `id_kostentraeger` INT(10) NOT NULL,
  `id_krankenkasse` INT(10) NOT NULL,
  `pflegegrad` ENUM('0','1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `mitarbeiter` (
  `id_mitarbeiter` INT(10) NOT NULL,
  `id_person` INT(10) NOT NULL,
  `einstellungsdatum` DATE NOT NULL,
  `position` VARCHAR(255) NOT NULL,
  `gehalt` FLOAT(24) NOT NULL,
  `monatliches_rating` FLOAT(5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `hausbesuch_bewertung` (
  `id_mitarbeiter` INT(10) NOT NULL,
  `id_patient` INT(10) NOT NULL,
  `datum` DATE NOT NULL,
  `bewertung` INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `angehoerige` (
  `id_patient` INT(10) NOT NULL,
  `id_person` INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `abwesenheit_typ` (
  `id_abwesenheit_typ` INT(10) NOT NULL,
  `bezeichnung` ENUM('Urlaub', 'Krank', 'Feiertag', 'Wochenende') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `abwesenheit` (
  `id_mitarbeiter` INT(10) NOT NULL,
  `datum` DATE NOT NULL,
  `id_abwesenheit_typ` INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `fuhrpark` (
  `id_fahrzeug` INT(10) NOT NULL,
  `modell` VARCHAR(255) NOT NULL,
  `kennzeichen` VARCHAR(255) NOT NULL,
  `erstzulassung` DATE NOT NULL,
  `kilometerstand` FLOAT(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `tourenplan` (
  `id_tour` INT(10) NOT NULL,
  `datum` DATE NOT NULL,
  `id_mitarbeiter` INT(10) NOT NULL,
  `id_fahrzeug` INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `krankenkasse` (
  `id_krankenkasse` INT(10) NOT NULL,
  `id_adresse` INT(10) NOT NULL,
  `id_kostentraeger` INT(10) NOT NULL,
  `bezeichnung` VARCHAR(255) NOT NULL,
  `typ` ENUM('Gesetzlich', 'Privat') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `abrechnung` (
  `id_abrechnung` INT(10) NOT NULL,
  `id_kostentraeger` INT(10) NOT NULL,
  `datum` DATE NOT NULL,
  `gesamtkosten` FLOAT(25)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `eigenanteil` (
  `id_eigenanteil` INT(10) NOT NULL,
  `id_abrechnung` INT(10) NOT NULL,
  `gesamtkosten` FLOAT(25) NOT NULL,
  `id_kostentraeger` INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `hausbesuch` (
  `id_hausbesuch` INT(10) NOT NULL,
  `id_tour` INT(10) NOT NULL,
  `id_patient` INT(10) NOT NULL,
  `startzeit` TIME NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `abrechnung_position` (
  `id_abrechnung` INT(10) NOT NULL,
  `id_hausbesuch` INT(10) NOT NULL,
  `kosten` FLOAT(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `pflegesachleistung` (
  `id_pflegesachleistung` INT(10) NOT NULL,
  `bezeichnung` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `leistungskomplex` (
  `id_leistungskomplex` INT(10) NOT NULL,
  `bezeichnung` VARCHAR(255) NOT NULL,
  `punkte` INT(10) NOT NULL,
  `preis` FLOAT(25) NOT NULL,
  `dauer` INT(10) NOT NULL COMMENT 'in Minuten'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `leistungskomplex_position` (
  `id_leistungskomplex` INT(10) NOT NULL,
  `id_pflegesachleistung` INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `vertrag_leistung` (
  `id_patient` INT(10) NOT NULL,
  `id_leistungskomplex` INT(10) NOT NULL,
  `anzahl` INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `hausbesuch_leistung` (
  `id_hausbesuch` INT(10) NOT NULL,
  `id_leistungskomplex` INT(10) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
--   Indizes 
--


ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`);
  
  
ALTER TABLE `person`
  ADD PRIMARY KEY (`id_person`),
  ADD KEY `id_adresse` (`id_adresse`);
  
  
ALTER TABLE `kostentraeger`
  ADD PRIMARY KEY (`id_kostentraeger`);
  
  
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_patient`),
  ADD KEY `id_person` (`id_person`),
  ADD KEY `id_kostentraeger` (`id_kostentraeger`),
  ADD KEY `id_krankenkasse` (`id_krankenkasse`);
   
  
ALTER TABLE `mitarbeiter`
  ADD PRIMARY KEY (`id_mitarbeiter`),
  ADD KEY `id_person` (`id_person`);

  
ALTER TABLE `hausbesuch_bewertung`
  ADD PRIMARY KEY (`id_mitarbeiter`,`id_patient`, `datum`),
  ADD KEY `id_mitarbeiter` (`id_mitarbeiter`),
  ADD KEY `id_patient` (`id_patient`);
  
  
ALTER TABLE `angehoerige`
  ADD PRIMARY KEY (`id_patient`,`id_person`),
  ADD KEY `id_patient` (`id_patient`),
  ADD KEY `id_person` (`id_person`);
  
  
ALTER TABLE `abwesenheit_typ`
  ADD PRIMARY KEY (`id_abwesenheit_typ`);
  
  
ALTER TABLE `abwesenheit`
  ADD PRIMARY KEY (`id_mitarbeiter`,`datum`),
  ADD KEY `id_mitarbeiter` (`id_mitarbeiter`),
  ADD KEY `id_abwesenheit_typ` (`id_abwesenheit_typ`);
  
  
ALTER TABLE `fuhrpark`
  ADD PRIMARY KEY (`id_fahrzeug`);
  
  
ALTER TABLE `tourenplan`
  ADD PRIMARY KEY (`id_tour`),
  ADD KEY `id_mitarbeiter` (`id_mitarbeiter`),
  ADD KEY `id_fahrzeug` (`id_fahrzeug`);
  
  
ALTER TABLE `krankenkasse`
  ADD PRIMARY KEY (`id_krankenkasse`),
  ADD KEY `id_adresse` (`id_adresse`),
  ADD KEY `id_kostentraeger` (`id_kostentraeger`);
  
  
ALTER TABLE `abrechnung`
  ADD PRIMARY KEY (`id_abrechnung`),
  ADD KEY `id_kostentraeger` (`id_kostentraeger`);
  
  
ALTER TABLE `eigenanteil`
  ADD PRIMARY KEY (`id_eigenanteil`),
  ADD KEY `id_abrechnung` (`id_abrechnung`),
  ADD KEY `id_kostentraeger` (`id_kostentraeger`);
  
  
ALTER TABLE `hausbesuch`
  ADD PRIMARY KEY (`id_hausbesuch`),
  ADD KEY `id_tour` (`id_tour`),
  ADD KEY `id_patient` (`id_patient`);
  
  
ALTER TABLE `abrechnung_position`
  ADD PRIMARY KEY (`id_abrechnung`,`id_hausbesuch`),
  ADD KEY `id_abrechnung` (`id_abrechnung`),
  ADD KEY `id_hausbesuch` (`id_hausbesuch`);
  
  
ALTER TABLE `pflegesachleistung`
  ADD PRIMARY KEY (`id_pflegesachleistung`);
  
  
ALTER TABLE `leistungskomplex`
  ADD PRIMARY KEY (`id_leistungskomplex`);
  
  
ALTER TABLE `leistungskomplex_position`
  ADD PRIMARY KEY (`id_leistungskomplex`,`id_pflegesachleistung`),
  ADD KEY `id_leistungskomplex` (`id_leistungskomplex`),
  ADD KEY `id_pflegesachleistung` (`id_pflegesachleistung`);
  
  
ALTER TABLE `vertrag_leistung`
  ADD PRIMARY KEY (`id_patient`,`id_leistungskomplex`),
  ADD KEY `id_patient` (`id_patient`),
  ADD KEY `id_leistungskomplex` (`id_leistungskomplex`);
  
  
ALTER TABLE `hausbesuch_leistung`
  ADD PRIMARY KEY (`id_hausbesuch`,`id_leistungskomplex`),
  ADD KEY `id_hausbesuch` (`id_hausbesuch`),
  ADD KEY `id_leistungskomplex` (`id_leistungskomplex`);
  

--
--   Constraints
--


-- Delete/Update adress data -> delete update person data, no adress no person
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- Delete/update person -> delete update patient
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`id_kostentraeger`) REFERENCES `kostentraeger` (`id_kostentraeger`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT,  
  ADD CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`id_krankenkasse`) REFERENCES `krankenkasse` (`id_krankenkasse`)
  	ON UPDATE CASCADE
    ON DELETE RESTRICT;


ALTER TABLE `mitarbeiter`
  ADD CONSTRAINT `mitarbeiter_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
  	ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE `angehoerige`
  ADD CONSTRAINT `angehoerige_ibfk_1` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`)
  	ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  ADD CONSTRAINT `angehoerige_ibfk_2` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
  	ON UPDATE CASCADE
    ON DELETE CASCADE;


ALTER TABLE `hausbesuch_bewertung`
  ADD CONSTRAINT `hausbesuch_bewertung_ibfk_1` FOREIGN KEY (`id_mitarbeiter`) REFERENCES `mitarbeiter` (`id_mitarbeiter`)
  	ON UPDATE CASCADE
    ON DELETE RESTRICT,  
  ADD CONSTRAINT `hausbesuch_bewertung_ibfk_2` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`)
  	ON UPDATE CASCADE
    ON DELETE RESTRICT;

  
ALTER TABLE `abwesenheit`
  ADD CONSTRAINT `abwesenheit_ibfk_1` FOREIGN KEY (`id_mitarbeiter`) REFERENCES `mitarbeiter` (`id_mitarbeiter`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT,  
  ADD CONSTRAINT `abwesenheit_ibfk_2` FOREIGN KEY (`id_abwesenheit_typ`) REFERENCES `abwesenheit_typ` (`id_abwesenheit_typ`)
  	ON UPDATE CASCADE
    ON DELETE RESTRICT;

  
ALTER TABLE `tourenplan`
  ADD CONSTRAINT `tourenplan_ibfk_1` FOREIGN KEY (`id_mitarbeiter`) REFERENCES `mitarbeiter` (`id_mitarbeiter`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT `tourenplan_ibfk_2` FOREIGN KEY (`id_fahrzeug`) REFERENCES `fuhrpark` (`id_fahrzeug`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;

  
ALTER TABLE `krankenkasse`
  ADD CONSTRAINT `krankenkasse_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT `krankenkasse_ibfk_2` FOREIGN KEY (`id_kostentraeger`) REFERENCES `kostentraeger` (`id_kostentraeger`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;
  

ALTER TABLE `abrechnung`
  ADD CONSTRAINT `abrechnung_ibfk_1` FOREIGN KEY (`id_kostentraeger`) REFERENCES `kostentraeger` (`id_kostentraeger`)
  	ON UPDATE CASCADE
    ON DELETE RESTRICT;


ALTER TABLE `eigenanteil`
  ADD CONSTRAINT `eigenanteil_ibfk_1` FOREIGN KEY (`id_abrechnung`) REFERENCES `abrechnung` (`id_abrechnung`)
  	ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT `eigenanteil_ibfk_2` FOREIGN KEY (`id_kostentraeger`) REFERENCES `kostentraeger` (`id_kostentraeger`)
  	ON UPDATE CASCADE
    ON DELETE RESTRICT;


ALTER TABLE `abrechnung_position`
  ADD CONSTRAINT `abrechnung_position_ibfk_1` FOREIGN KEY (`id_abrechnung`) REFERENCES `abrechnung` (`id_abrechnung`)
	ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  ADD CONSTRAINT `abrechnung_position_ibfk_2` FOREIGN KEY (`id_hausbesuch`) REFERENCES `hausbesuch` (`id_hausbesuch`)
	ON UPDATE RESTRICT
    ON DELETE RESTRICT;

 
ALTER TABLE `hausbesuch`
  ADD CONSTRAINT `hausbesuch_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `tourenplan` (`id_tour`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT `hausbesuch_ibfk_2` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;


ALTER TABLE `hausbesuch_leistung`
  ADD CONSTRAINT `hausbesuch_leistung_ibfk_1` FOREIGN KEY (`id_hausbesuch`) REFERENCES `hausbesuch` (`id_hausbesuch`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT `hausbesuch_leistung_ibfk_2` FOREIGN KEY (`id_leistungskomplex`) REFERENCES `leistungskomplex` (`id_leistungskomplex`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;


ALTER TABLE `vertrag_leistung`
  ADD CONSTRAINT `vertrag_leistung_ibfk_1` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT `vertrag_leistung_ibfk_2` FOREIGN KEY (`id_leistungskomplex`) REFERENCES `leistungskomplex` (`id_leistungskomplex`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;


ALTER TABLE `leistungskomplex_position`
  ADD CONSTRAINT `leistungskomplex_position_ibfk_1` FOREIGN KEY (`id_leistungskomplex`) REFERENCES `leistungskomplex` (`id_leistungskomplex`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT `leistungskomplex_position_ibfk_2` FOREIGN KEY (`id_pflegesachleistung`) REFERENCES `pflegesachleistung` (`id_pflegesachleistung`)
	ON UPDATE CASCADE
    ON DELETE RESTRICT;
COMMIT;