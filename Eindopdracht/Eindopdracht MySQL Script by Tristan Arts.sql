-- MySQL Script by Tristan Arts
-- Thu Oct 28 15:20:53 2021
-- Model: New Model    Version: 1.0

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS speelautomaatdb DEFAULT CHARACTER SET utf8 ;
USE speelautomaatdb ;

-- -----------------------------------------------------
-- Table `speelautomaatdb`.`Bedrijf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS speelautomaatdb.Bedrijf (
  idBedrijf SMALLINT NOT NULL,
  naam_bedrijf VARCHAR(45) NOT NULL,
  afkorting VARCHAR(3) NOT NULL,
  PRIMARY KEY (idBedrijf),
  UNIQUE INDEX idBedrijf_UNIQUE (idBedrijf ASC) 
  )


-- -----------------------------------------------------
-- Table `speelautomaatdb`.`Medewerker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS speelautomaatdb.Medewerker (
  idMedewerker INT NOT NULL,
  naam_medewerker VARCHAR(45) NOT NULL,
  afkorting_medewerker VARCHAR(3) NOT NULL,
  PRIMARY KEY (idMedewerker),
  UNIQUE INDEX idMedewerker_UNIQUE (idMedewerker ASC) 
)


-- -----------------------------------------------------
-- Table `speelautomaatdb`.`Automaat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS speelautomaatdb.Automaat (
  idAutomaat INT NOT NULL,
  type VARCHAR(45) NOT NULL,
  idBedrijf INT NULL,
  PRIMARY KEY (idAutomaat),
  UNIQUE INDEX idAutomaat_UNIQUE (idAutomaat),
    FOREIGN KEY (idBedrijf)
    REFERENCES speelautomaatdb.Bedrijf (idBedrijf ASC)


-- -----------------------------------------------------
-- Table `speelautomaatdb`.`Opbrengst`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS speelautomaatdb.Opbrengst (
  idCodeOpbrengst INT NOT NULL,
  datum DATE NOT NULL,
  idMedewerker INT NOT NULL,
  opbrengst INT NOT NULL,
  idAutomaat INT NOT NULL,
  PRIMARY KEY (idCodeOpbrengst),
    FOREIGN KEY (idMedewerker)
    REFERENCES speelautomaatdb.Medewerker (idMedewerker)
  CONSTRAINT idAutomaat_UNIQUE
    FOREIGN KEY (idAutomaat)
    REFERENCES speelautomaatdb.Automaat (idAutomaat)
)
