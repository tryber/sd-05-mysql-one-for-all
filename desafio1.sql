-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` DEFAULT CHARACTER SET utf8 ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `id_plano` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NULL,
  `valor_plano` DECIMAL NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE INDEX `id_plano_UNIQUE` (`id_plano` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  `planos_id_plano` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `planos_id_plano`),
  UNIQUE INDEX `usuario_id_UNIQUE` (`usuario_id` ASC),
  INDEX `fk_usuarios_planos_idx` (`planos_id_plano` ASC),
  CONSTRAINT `fk_usuarios_planos`
    FOREIGN KEY (`planos_id_plano`)
    REFERENCES `SpotifyClone`.`planos` (`id_plano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artist_id` INT NOT NULL,
  `artista` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`artist_id`),
  UNIQUE INDEX `artist_id_UNIQUE` (`artist_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `album_id` INT NOT NULL,
  `album` VARCHAR(100) NULL,
  `artistas_artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE INDEX `album_id_UNIQUE` (`album_id` ASC),
  INDEX `fk_albuns_artistas1_idx` (`artistas_artist_id` ASC),
  CONSTRAINT `fk_albuns_artistas1`
    FOREIGN KEY (`artistas_artist_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id_cancao` INT NOT NULL AUTO_INCREMENT,
  `cancao` VARCHAR(50) NOT NULL,
  `albuns_album_id` INT NOT NULL,
  PRIMARY KEY (`id_cancao`),
  UNIQUE INDEX `historic_id_UNIQUE` (`id_cancao` ASC),
  INDEX `fk_cancoes_albuns1_idx` (`albuns_album_id` ASC),
  CONSTRAINT `fk_cancoes_albuns1`
    FOREIGN KEY (`albuns_album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`historic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historic` (
  `historic_id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_usuario_id` INT NOT NULL,
  `cancoes_id_cancao` INT NOT NULL,
  PRIMARY KEY (`historic_id`, `cancoes_id_cancao`, `usuarios_usuario_id`),
  INDEX `fk_usuarios_has_cancoes_cancoes1_idx` (`cancoes_id_cancao` ASC),
  INDEX `fk_usuarios_has_cancoes_usuarios1_idx` (`usuarios_usuario_id` ASC),
  UNIQUE INDEX `historic_id_UNIQUE` (`historic_id` ASC),
  CONSTRAINT `fk_usuarios_has_cancoes_usuarios1`
    FOREIGN KEY (`usuarios_usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_cancoes_cancoes1`
    FOREIGN KEY (`cancoes_id_cancao`)
    REFERENCES `SpotifyClone`.`cancoes` (`id_cancao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios_has_artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios_has_artistas` (
  `usuarios_usuario_id` INT NOT NULL,
  `usuarios_planos_id_plano` INT NOT NULL,
  `artistas_artist_id` INT NOT NULL,
  PRIMARY KEY (`usuarios_usuario_id`, `usuarios_planos_id_plano`, `artistas_artist_id`),
  INDEX `fk_usuarios_has_artistas_artistas1_idx` (`artistas_artist_id` ASC),
  INDEX `fk_usuarios_has_artistas_usuarios1_idx` (`usuarios_usuario_id` ASC, `usuarios_planos_id_plano` ASC),
  CONSTRAINT `fk_usuarios_has_artistas_usuarios1`
    FOREIGN KEY (`usuarios_usuario_id` , `usuarios_planos_id_plano`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id` , `planos_id_plano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_artistas_artistas1`
    FOREIGN KEY (`artistas_artist_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

