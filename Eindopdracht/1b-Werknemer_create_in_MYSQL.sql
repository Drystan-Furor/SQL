CREATE SCHEMA Werknemer;

USE Werknemer;

-- Create Table: afdeling
CREATE TABLE Afdeling
(
  anr numeric(2) NOT NULL,
  anaam varchar(14) NOT NULL,
  locatie varchar(13) NOT NULL,
  CONSTRAINT afdeling_pkey PRIMARY KEY (anr)
);

-- Create Table: Prive
CREATE TABLE Prive
(
  wnr numeric(4) NOT NULL,
  wnaam varchar(10) NOT NULL,
  voorletter varchar(6),
  adres varchar(25),
  postcode varchar(6),
  woonplaats varchar(15),
  CONSTRAINT prive_pkey PRIMARY KEY (wnr)
);


-- Create Table: s_schaal
CREATE TABLE S_schaal
(
  schaal numeric NOT NULL,
  ondergrens numeric NOT NULL,
  bovengrens numeric NOT NULL,
  CONSTRAINT schaal_pkey PRIMARY KEY (schaal)
);

-- Create table: werknemer
CREATE TABLE Werknemer
(
  wnr numeric(4) NOT NULL,
  wnaam varchar(10) NOT NULL,
  functie varchar(10) NOT NULL,
  chef numeric(4),
  indienst date NOT NULL,
  salaris numeric(7,2) NOT NULL,
  commissie numeric(7,2),
  anr numeric(2),
  CONSTRAINT werknemer_pkey PRIMARY KEY (wnr)
);

ALTER TABLE `Werknemer`.`Werknemer` 
ADD INDEX `werknemer_afdeling_fk_idx` (`anr` ASC),
ADD INDEX `werknemer_chef_fk_idx` (`chef` ASC);

ALTER TABLE `Werknemer`.`Werknemer` 
ADD CONSTRAINT `werknemer_afdeling_fk`
  FOREIGN KEY (`anr`)
  REFERENCES `Werknemer`.`Afdeling` (`anr`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
ADD CONSTRAINT `Werknemer_chef_fk`
  FOREIGN KEY (`chef`)
  REFERENCES `Werknemer`.`Werknemer` (`wnr`)
  ON DELETE RESTRICT
  ON UPDATE SET NULL;

ALTER TABLE `Werknemer`.`Prive` 
ADD CONSTRAINT `prive_werknemer`
  FOREIGN KEY (`wnr`)
  REFERENCES `Werknemer`.`Werknemer` (`wnr`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;