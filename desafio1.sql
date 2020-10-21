
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
  `id_plano` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NULL,
  `valor_plano` DECIMAL NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE INDEX `id_plano_UNIQUE` (`id_plano` ASC) )
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
  UNIQUE INDEX `usuario_id_UNIQUE` (`usuario_id` ASC) ,
  INDEX `fk_usuarios_planos_idx` (`planos_id_plano` ASC) ,
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
  UNIQUE INDEX `artist_id_UNIQUE` (`artist_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `album_id` INT NOT NULL,
  `album` VARCHAR(100) NULL,
  `artistas_artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE INDEX `album_id_UNIQUE` (`album_id` ASC) ,
  INDEX `fk_albuns_artistas1_idx` (`artistas_artist_id` ASC) ,
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
  UNIQUE INDEX `historic_id_UNIQUE` (`id_cancao` ASC) ,
  INDEX `fk_cancoes_albuns1_idx` (`albuns_album_id` ASC) ,
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
  INDEX `fk_usuarios_has_cancoes_cancoes1_idx` (`cancoes_id_cancao` ASC) ,
  INDEX `fk_usuarios_has_cancoes_usuarios1_idx` (`usuarios_usuario_id` ASC) ,
  UNIQUE INDEX `historic_id_UNIQUE` (`historic_id` ASC) ,
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
-- Table `SpotifyClone`.`usuarios_seguem_artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios_seguem_artistas` (
  `id_following` INT NOT NULL AUTO_INCREMENT,
  `usuarios_usuario_id` INT NOT NULL,
  `artistas_artist_id` INT NOT NULL,
  PRIMARY KEY (`id_following`, `usuarios_usuario_id`, `artistas_artist_id`),
  INDEX `fk_usuarios_has_artistas_artistas1_idx` (`artistas_artist_id` ASC) ,
  INDEX `fk_usuarios_has_artistas_usuarios1_idx` (`usuarios_usuario_id` ASC, `id_following` ASC) ,
  UNIQUE INDEX `id_following_UNIQUE` (`id_following` ASC) ,
  CONSTRAINT `fk_usuarios_has_artistas_usuarios1`
    FOREIGN KEY (`usuarios_usuario_id` , `id_following`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id` , `planos_id_plano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_artistas_artistas1`
    FOREIGN KEY (`artistas_artist_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



INSERT INTO `SpotifyClone`.`planos` (id_plano, plano, valor_plano)
VALUES
(1, 'gratuito',	0),
(2,	'familiar',	7.99),
(3,	'universitário',	5.99),
(4,	'gratuito',	0);

INSERT INTO `SpotifyClone`.`usuarios` (usuario_id,usuario,idade,planos_id_plano)
VALUES
(1,'Thati',23,1),
(2,'Cintia',35,2),
(3,'Bill',20,3),
(4,'Roger',45,4);

INSERT INTO `SpotifyClone`.`historic` (historic_id, usuarios_usuario_id,cancoes_id_cancao)
VALUES
(1,1,1),
(2,1,6),
(3,1,14),
(4,1,16),
(5,2,13),
(6,2,17),
(7,2,2),
(8,2,15),
(9,3,4),
(10,3,16),
(11,3,6),
(12,4,2),
(13,4,18),
(14,4,11);

INSERT INTO `SpotifyClone`.`artistas` (artist_id,artista)
VALUES
(1,'Walter Phoenix'),
(2,'Peter Strong'),
(3,'Lance Day'),
(4,'Freedie Shannon');

INSERT INTO `SpotifyClone`.`usuarios_seguem_artistas` (id_following,usuarios_usuario_id,artistas_artist_id	)
VALUES
(1,1,1),
(2,1,4),
(3,1,3),
(4,2,1),
(5,2,3),
(6,3,1),
(7,3,2),
(8,4,4);

INSERT INTO `SpotifyClone`.`albuns` (album_id,album,artistas_artist_id)
VALUES
(1,'Envious',1),
(2,'Exuberant',1),
(3,'Hallowed Steam',2),
(4,'Incandescent',3),
(5,'Temporary Culture',4);

INSERT INTO `SpotifyClone`.`cancoes` (id_cancao,cancao,albuns_album_id)
VALUES
(1,"Soul For Us",1),
(2,"Reflections Of Magic",1),
(3,"Dance With Her Own",1),
(4,"Troubles Of My Inner Fire",2),
(5,"Time Fireworks",2),
(6,"Magic Circus",3),
(7,"Honey, So Do I",3),
(8,"Sweetie, Let's Go Wild",3),
(9,"She Knows",3),
(10,"Fantasy For Me",4),
(11,"Celebration Of More",4),
(12,"Rock His Everything",4),
(13,"Home Forever",4),
(14,"Diamond Power",4),
(15,"Honey, Let's Be Silly",4),
(16,"Thang Of Thunder",5),
(17,"Words Of Her Life",5),
(18,"Without My Streets",5);
