DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `planos`(
    `plano_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `plano` VARCHAR(45) NOT NULL,
    `valor_plano` DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (`plano_id`)
) engine = InnoDB;

CREATE TABLE `usuarios`(
    `usuario_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `usuario` VARCHAR(45) NOT NULL,
    `idade` INT NOT NULL,
    `plano_id` INT NOT NULL,
    PRIMARY KEY (`usuario_id`),
    CONSTRAINT `fk_plano_id_usuario` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`plano_id`)
) engine = InnoDB;

CREATE TABLE `artistas`(
    `artista_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `artista` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`artista_id`)
) engine = InnoDB;

CREATE TABLE `albuns`(
    `album_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `album` VARCHAR(45) NOT NULL,
    `artista_id` INT NOT NULL,
    PRIMARY KEY (`album_id`),
    CONSTRAINT `fk_artista_id_album` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`artista_id`)
) engine = InnoDB;

CREATE TABLE `cancoes`(
    `cancao_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `cancao` VARCHAR(45) NOT NULL,
    `album_id` INT NOT NULL,
    PRIMARY KEY (`cancao_id`),
    CONSTRAINT `fk_album_id_cancao` FOREIGN KEY (`album_id`) REFERENCES `albuns` (`album_id`)
) engine = InnoDB;

CREATE TABLE `historico_de_reproducoes` (
    `usuario_id` INT NOT NULL,
    `cancao_id` INT NOT NULL,
    PRIMARY KEY (`usuario_id`, `cancao_id`),
    CONSTRAINT `fk_usuario_id_cancao` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
    CONSTRAINT `fk_cancao_id_usuario` FOREIGN KEY (`cancao_id`) REFERENCES `cancoes` (`cancao_id`)
) engine = InnoDB;

CREATE TABLE `seguindo_artistas` (
    `usuario_id` INT NOT NULL,
    `artista_id` INT NOT NULL,
    PRIMARY KEY (`usuario_id`, `artista_id`),
    CONSTRAINT `fk_usuario_id_artista` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
    CONSTRAINT `fk_artista_id_usuario` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`artista_id`)
) engine = InnoDB;

INSERT INTO planos (plano, valor_plano)
VALUES
('gratuito', 0.00),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO usuarios (usuario, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artistas (artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns (album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancoes (cancao, album_id)
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

INSERT INTO historico_de_reproducoes (usuario_id, cancao_id)
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

INSERT INTO seguindo_artistas (usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
