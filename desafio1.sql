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

INSERT INTO cancoes (nome_cancao, artista_id, albuns_id) VALUES
('Celebration Of More', 3, 4),
('Dance With Her Own', 1, 1),
('Diamond Power', 3, 4),
('Fantasy For Me', 3, 4),
('Home Forever', 3, 4),
('Dance With Her Own', 3, 4),
('Honey, Let''s Be Silly', 3, 4),
('Honey, So Do I', 2, 3),
('Reflections Of Magic', 1, 1),
('Rock His Everything', 3, 4),
('She Knows', 2, 3),
('Soul For Us', 1, 1),
('Sweetie, Let''s Go Wild', 2, 3),
('Thang Of Thunder', 4, 5),
('Time Fireworks', 1, 2),
('Troubles Of My Inner Fire', 1, 2),
('Without My Streets', 4, 5),
('Words Of Her Life', 4, 5);

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
(1, 12),
(1, 8),
(1, 3),
(1, 14),
(2, 5),
(2, 18),
(2, 9),
(2, 6),
(3, 16),
(3, 14),
(3, 8),
(4, 2),
(4, 17),
(4, 1);
