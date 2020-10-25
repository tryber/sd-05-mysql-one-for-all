DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS `plano` (
  `id` INT(11) AUTO_INCREMENT,
  `plano` VARCHAR(32) NOT NULL,
  `valor` FLOAT DEFAULT 0.0,
  PRIMARY KEY (`id`)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` INT(11) AUTO_INCREMENT,
  `usuario` VARCHAR(32) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`plano_id`) REFERENCES plano(`id`)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS `artista` (
  `id` INT(11) AUTO_INCREMENT,
  `artista` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS `album` (
  `id` INT(11) AUTO_INCREMENT,
  `album` VARCHAR(32) NOT NULL,
  `artista_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`artista_id`) REFERENCES artista(`id`)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS `cancao` (
  `id` INT(11) AUTO_INCREMENT,
  `cancao` VARCHAR(32) NOT NULL,
  `album_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`album_id`) REFERENCES album(`id`)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS `seguindo` (
  -- `id` INT(11) AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  CONSTRAINT `fk_usuario_id_artista` FOREIGN KEY (`usuario_id`) REFERENCES usuario(`id`),
  CONSTRAINT `fk_artista_id_usuario` FOREIGN KEY (`artista_id`) REFERENCES artista(`id`)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS `reproducao` (
  -- `id` INT(11) AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
  CONSTRAINT `fk_usuario_id_cancao` FOREIGN KEY (`usuario_id`) REFERENCES usuario(`id`),
  CONSTRAINT `fk_cancao_id_usuario` FOREIGN KEY (`cancao_id`) REFERENCES cancao(`id`)
) engine = InnoDB;

INSERT INTO `plano` (plano, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 5.99),
  ('universitário', 7.77);

INSERT INTO `usuario` (`usuario`, `idade`, `plano_id`)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO `artista` (`artista`)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO `album` (`album`, `artista_id`)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO `seguindo` (`usuario_id`, `artista_id`)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

INSERT INTO `cancao` (`cancao`, `album_id`)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic',1),
  ('Dance With Her Own',1),
  ('Troubles Of My Inner Fire', 2),
  ('Time',2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ("Honey, Let's Be Silly", 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO `reproducao` (`usuario_id`, `cancao_id`)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
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
