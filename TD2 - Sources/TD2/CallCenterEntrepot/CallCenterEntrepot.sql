-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema entrepot
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema entrepot
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `entrepot` DEFAULT CHARACTER SET latin1 ;
USE `entrepot` ;

-- -----------------------------------------------------
-- Table `entrepot`.`commerciaux`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrepot`.`commerciaux` (
  `idcommerciaux` INT NOT NULL AUTO_INCREMENT,
  `nomCommercial` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcommerciaux`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepot`.`site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrepot`.`site` (
  `id_site` INT NOT NULL AUTO_INCREMENT,
  `ville` VARCHAR(45) NOT NULL,
  `nomSite` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_site`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepot`.`temps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrepot`.`temps` (
  `id_temps` DATETIME NOT NULL,
  `tranche_horaire` VARCHAR(12) NOT NULL,
  `jour` VARCHAR(10) NOT NULL,
  `semaine` VARCHAR(8) NOT NULL,
  `mois` VARCHAR(6) NOT NULL,
  `annee` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`id_temps`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepot`.`campagne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrepot`.`campagne` (
  `id_campagne` INT NOT NULL AUTO_INCREMENT,
  `type_campagne` VARCHAR(45) NOT NULL,
  `type_renumeration` VARCHAR(45) NOT NULL,
  `codeCampagne` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_campagne`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepot`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrepot`.`client` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `pays` VARCHAR(45) NOT NULL,
  `nomClient` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entrepot`.`appels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrepot`.`appels` (
  `commerciaux_idcommerciaux` INT NOT NULL,
  `site_id_site` INT NOT NULL,
  `temps_id_temps` DATETIME NOT NULL,
  `campagne_id_campagne` INT NOT NULL,
  `client_id_client` INT NOT NULL,
  `quantite` INT NOT NULL,
  `qualife` INT NOT NULL,
  `traite` INT NOT NULL,
  `perdu` INT NOT NULL,
  `nb_teleconseiller` INT NOT NULL,
  PRIMARY KEY (`commerciaux_idcommerciaux`, `site_id_site`, `temps_id_temps`, `campagne_id_campagne`, `client_id_client`),
  INDEX `fk_appels_site1_idx` (`site_id_site` ASC),
  INDEX `fk_appels_temps1_idx` (`temps_id_temps` ASC),
  INDEX `fk_appels_campagne1_idx` (`campagne_id_campagne` ASC),
  INDEX `fk_appels_client1_idx` (`client_id_client` ASC),
  CONSTRAINT `fk_appels_commerciaux`
    FOREIGN KEY (`commerciaux_idcommerciaux`)
    REFERENCES `entrepot`.`commerciaux` (`idcommerciaux`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appels_site1`
    FOREIGN KEY (`site_id_site`)
    REFERENCES `entrepot`.`site` (`id_site`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appels_temps1`
    FOREIGN KEY (`temps_id_temps`)
    REFERENCES `entrepot`.`temps` (`id_temps`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appels_campagne1`
    FOREIGN KEY (`campagne_id_campagne`)
    REFERENCES `entrepot`.`campagne` (`id_campagne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appels_client1`
    FOREIGN KEY (`client_id_client`)
    REFERENCES `entrepot`.`client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
