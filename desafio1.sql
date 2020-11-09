CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor_plano` DECIMAL(5,2) NULL,
  `nome_plano` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios` VARCHAR(45) NULL,
  `idade` INT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`id`, `plano_id`),
  UNIQUE INDEX `idusuario_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_usuario_plano1_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_plano1`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`plano` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_album_artista1_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_cancoes` VARCHAR(45) NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cancoes_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario_has_cancoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `cancoes_id` INT NOT NULL,
  INDEX `fk_usuario_has_cancoes_cancoes1_idx` (`cancoes_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_cancoes_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_cancoes_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_cancoes_cancoes1`
    FOREIGN KEY (`cancoes_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario_has_artista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  INDEX `fk_usuario_has_artista_artista1_idx` (`artista_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_artista_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_artista_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_artista_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
