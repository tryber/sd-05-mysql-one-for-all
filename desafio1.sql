DROP DATABASE IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS `SpotifyClone`;

USE `SpotifyClone`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_plano` VARCHAR(45) NULL,
  `valor_plano` DECIMAL(5,2) NULL,
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL,
  `idade` INT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`id`),
    CONSTRAINT `fk_usuarios_planos`
    FOREIGN KEY (`planos_id`)
    REFERENCES `SpotifyClone`.`planos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NULL,
  `artista_id` INT NOT NULL,
  CONSTRAINT `fk_albuns_artistas`
  PRIMARY KEY (`id`),
    FOREIGN KEY (`artistas_id`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_cancoes` VARCHAR(45) NULL,
  `album_id` INT NOT NULL,
  CONSTRAINT `fk_cancoes_albuns`
  PRIMARY KEY (`id`),
    FOREIGN KEY (`albuns_id`)
    REFERENCES `SpotifyClone`.`albuns` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  CONSTRAINT `fk_seguindo_artistas_usuarios`
  PRIMARY KEY (`id`),
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION,
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO planos (valor_plano, nome_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO usuarios (usuario, idade, planos_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artistas (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
INSERT INTO albuns (nome_album, artistas_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO cancoes (nome_cancoes, albuns_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
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
