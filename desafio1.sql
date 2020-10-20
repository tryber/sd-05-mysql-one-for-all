DROP DATABASE IF EXISTS `SpotifyClone`; 
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

INSERT INTO SpotifyClone.planos (tipo_plano, valor) VALUES
('gratuito', 0),
('familiar', 7.99),
('universitario', 5.99);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `plano_id` INT NOT NULL,
  `idade` INT NOT NULL,
  `nome_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario_id`),
FOREIGN KEY (`plano_id`) REFERENCES `SpotifyClone`.`planos` (`plano_id`))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.usuario (nome_usuario, idade, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;

INSERT INTO artistas (nome_artista) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `albuns_id` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`albuns_id`),
  FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artistas`(`artista_id`))
ENGINE = InnoDB;

INSERT INTO albuns (nome_album, artista_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);


-- -----------------------------------------------------
-- Table `SpotifyClone`.`canções`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
`cancoes_id` INT NOT NULL AUTO_INCREMENT,
`nome_cancao` VARCHAR(60) NOT NULL,
`artista_id` INT NOT NULL,
`albuns_id` INT NOT NULL,
  PRIMARY KEY (`cancoes_id`),
FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`),
    FOREIGN KEY (`albuns_id`)
    REFERENCES `SpotifyClone`.`albuns` (`albuns_id`))
ENGINE = InnoDB;

INSERT INTO cancoes (nome_cancao, albuns_id, artista_id) VALUES
('Soul For Us', 1, 1),
('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 2, 1),
('Time Fireworks', 2, 1),
('Magic Circus', 3, 2),
('Honey, So Do I', 3, 2),
("Sweetie, Let's Go Wild", 3, 2),
('She Knows', 3, 2),
('Fantasy For Me', 4, 3),
('Celebration Of More', 4, 3),
('Rock His Everything', 4, 3),
('Home Forever', 4, 3),
('Diamond Power', 4, 3),
("Honey, Let's Be Silly", 4, 3),
('Thang Of Thunder', 5, 4),
('Words Of Her Life', 5, 4),
('Without My Streets', 5, 4);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguidores` (
  `artista_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`artista_id`, `usuario_id`),
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`),
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`))
ENGINE = InnoDB;

INSERT INTO seguidores (usuario_id, artista_id) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`hreprodução`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`hreprodução` (
  `usuario_id` INT NOT NULL,
  `cancoes_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancoes_id`),
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`),
    FOREIGN KEY (`cancoes_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`cancoes_id`))
ENGINE = InnoDB;

INSERT INTO hreprodução (usuario_id, cancoes_id) VALUES
(1, 1),
(1, 6),
(1, 16),
(1, 14),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
