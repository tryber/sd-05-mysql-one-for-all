DROP DATABASE IF EXISTS SpotifyClone;
-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`id`, `plan_id`),
  INDEX `fk_user_plan_idx` (`plan_id` ASC),
  CONSTRAINT `fk_user_plan`
    FOREIGN KEY (`plan_id`)
    REFERENCES `SpotifyClone`.`plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`id`, `artist_id`),
  INDEX `fk_album_artist1_idx` (`artist_id` ASC),
  CONSTRAINT `fk_album_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `artist_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`, `artist_id`, `album_id`),
  INDEX `fk_songs_artist1_idx` (`artist_id` ASC),
  INDEX `fk_songs_album1_idx` (`album_id` ASC),
  CONSTRAINT `fk_songs_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`follow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`follow` (
  `usuario_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artist_id`),
  INDEX `fk_user_has_artist_artist1_idx` (`artist_id` ASC),
  INDEX `fk_user_has_artist_user1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_usuario_has_artist_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_artist_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`reproductions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`reproductions` (
  `usuario_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `songs_id`),
  INDEX `fk_usuario_has_user_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_reproductions_songs1_idx` (`songs_id` ASC),
  CONSTRAINT `fk_usuario_has_usuario_user1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reproductions_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES `SpotifyClone`.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.plan (plano, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.usuario (nome, idade, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO SpotifyClone.artist (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');  
  
INSERT INTO SpotifyClone.album (nome, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
  
INSERT INTO SpotifyClone.songs (nome, artist_id, album_id)
VALUES
  ('Soul For Us', 1, 1),
  (' Reflections Of Magic', 1, 1),
  (' Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 1, 2),
  (' Time Fireworks', 1, 2),
  ('Magic Circus', 2, 3),
  ('Honey, So Do I', 2, 3),
  ('Sweetie', 2, 3),
  ("Let's Go Wild", 2, 3),
  ('She Knows', 2, 3),
  ('Fantasy For Me', 3, 4),
  ('Celebration Of More', 3, 4),
  ('Rock His Everything', 3, 4),
  ('Home Forever', 3, 4),
  ('Diamond Power', 3, 4),
  ("Honey, Let's Be Silly", 3, 4),
  ('Thang Of Thunder', 4, 5),
  ('Words Of Her Life', 4, 5),
  ('Without My Streets', 4, 5);
  
  INSERT INTO SpotifyClone.follow (usuario_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4);
  
  INSERT INTO SpotifyClone.reproductions (usuario_id, songs_id)
VALUES
(1, 1),
(1,	6),
(1,	15),
(1,	17),
(2,	14),
(2,	18),
(2,	2),
(2,	16),
(3,	4),
(3,	17),
(3,	6),
(4,	3),
(4,	19),
(4,	12);
