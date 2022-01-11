-- MySQL Script by Tristan Arts
-- Sat Nov  6 11:56:55 2021
-- Model: New Model    Version: 1.0

-- -----------------------------------------------------
-- Schema bakkerij
-- -----------------------------------------------------
-- DROP DATABASE bakkerij;
CREATE SCHEMA IF NOT EXISTS `bakkerij` DEFAULT CHARACTER SET utf8 ;
USE `bakkerij` ;

-- -----------------------------------------------------
-- Table `bakkerij`.`Klant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakkerij`.`Klant` (
  `idKlant` INT NOT NULL AUTO_INCREMENT,
  `Voornaam` VARCHAR(45) NULL,
  `Achternaam` VARCHAR(45) NOT NULL,
  `Adres` VARCHAR(45) NOT NULL,
  `Postcode` VARCHAR(6) NOT NULL,
  `Woonplaats` VARCHAR(45) NOT NULL,
  `Telefoonnummer` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idKlant`),
  UNIQUE INDEX `idKlant_UNIQUE` (`idKlant` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `bakkerij`.`Factuur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakkerij`.`Factuur` (
  `idFactuur` INT NOT NULL AUTO_INCREMENT,
  `Factuur_Adres` VARCHAR(45) NOT NULL,
  `Factuur_Postcode` VARCHAR(6) NOT NULL,
  `Factuur_Plaatsnaam` VARCHAR(45) NULL,
  `idKlant` INT NOT NULL,
  PRIMARY KEY (`idFactuur`),
  UNIQUE INDEX `idFactuur_UNIQUE` (`idFactuur` ASC) VISIBLE,
  INDEX `idKlant` (`idKlant` ASC) VISIBLE,
  CONSTRAINT `idKlant`
    FOREIGN KEY (`idKlant`)
    REFERENCES `bakkerij`.`Klant` (`idKlant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `bakkerij`.`Artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakkerij`.`Artikel` (
  `idArtikel` INT NOT NULL AUTO_INCREMENT,
  `Artikel_Naam` VARCHAR(45) NOT NULL,
  `Artikel_Prijs` decimal(4,2) NOT NULL,
  PRIMARY KEY (`idArtikel`),
  UNIQUE INDEX `idArtikel_UNIQUE` (`idArtikel` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `bakkerij`.`Bestelling`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bakkerij`.`Bestelling` (
  `idBestelling` INT NOT NULL AUTO_INCREMENT,
  `Bezorg_Adres` VARCHAR(45) NOT NULL,
  `Bezorg_Postcode` VARCHAR(6) NOT NULL,
  `Bezorg_Plaatsnaam` VARCHAR(45) NULL,
  `idFactuur` INT NOT NULL,
  `idKlant` INT NOT NULL,
  `idArtikel` INT NOT NULL,
  `Artikel_aantal` INT NULL,
  PRIMARY KEY (`idBestelling`, `idFactuur`, `idKlant`),
  UNIQUE INDEX `idBestelling_UNIQUE` (`idBestelling` ASC) VISIBLE,
  INDEX `idFactuur_idx` (`idFactuur` ASC) VISIBLE,
  INDEX `idKlant_idx` (`idKlant` ASC) VISIBLE,
  INDEX `idArtikel_idx` (`idArtikel` ASC) VISIBLE,
  CONSTRAINT `idFactuur`
    FOREIGN KEY (`idFactuur`)
    REFERENCES `bakkerij`.`Factuur` (`idFactuur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `Klant.idKlant`
    FOREIGN KEY (`idKlant`)
    REFERENCES `bakkerij`.`Klant` (`idKlant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idArtikel`
    FOREIGN KEY (`idArtikel`)
    REFERENCES `bakkerij`.`Artikel` (`idArtikel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


