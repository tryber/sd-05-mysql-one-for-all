-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(5,2) NOT NULL,
  `tipo_plano` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`plano_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `plano_id` INT NOT NULL,
  `idade` INT NOT NULL,
  `nome_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `fk_usuario_1_idx` (`plano_id` ASC),
  CONSTRAINT `fk_usuario_1`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`planos` (`plano_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `albuns_id` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`albuns_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`canções`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`canções` (
  `cancoes_id` INT NOT NULL AUTO_INCREMENT,
  `nome_cancao` VARCHAR(45) NOT NULL,
  `albuns_id` INT NOT NULL,
  PRIMARY KEY (`cancoes_id`),
  INDEX `fk_canções_1_idx` (`albuns_id` ASC),
  CONSTRAINT `fk_canções_1`
    FOREIGN KEY (`albuns_id`)
    REFERENCES `SpotifyClone`.`albuns` (`albuns_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguidores` (
  `idseguidores` INT NOT NULL AUTO_INCREMENT,
  `artista_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`idseguidores`),
  INDEX `fk_seguidores_1_idx` (`artista_id` ASC),
  INDEX `fk_seguidores_2_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_seguidores_1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguidores_2`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`hreprodução`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`hreprodução` (
  `idhreprodução` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `cancoes_id` INT NOT NULL,
  PRIMARY KEY (`idhreprodução`),
  INDEX `fk_hreprodução_1_idx` (`usuario_id` ASC),
  INDEX `fk_hreprodução_2_idx` (`cancoes_id` ASC),
  CONSTRAINT `fk_hreprodução_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hreprodução_2`
    FOREIGN KEY (`cancoes_id`)
    REFERENCES `SpotifyClone`.`canções` (`cancoes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas_albuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas_albuns` (
  `idartistas_albuns` INT NOT NULL AUTO_INCREMENT,
  `artista_id` INT NOT NULL,
  `albuns_id` INT NOT NULL,
  PRIMARY KEY (`idartistas_albuns`),
  INDEX `fk_artistas_albuns_1_idx` (`artista_id` ASC),
  INDEX `fk_artistas_albuns_2_idx` (`albuns_id` ASC),
  CONSTRAINT `fk_artistas_albuns_1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artistas_albuns_2`
    FOREIGN KEY (`albuns_id`)
    REFERENCES `SpotifyClone`.`albuns` (`albuns_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
