DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `artistas` (
`artista_id` INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
`artista_nome` VARCHAR(80) NOT NULL
) engine = InnoDB;

CREATE TABLE `planos`(
`plano_id` INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
`plano_nome` VARCHAR(100) NOT NULL,
`valor` DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE `usuarios` (
`usuario_id` INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
`usuario_nome` VARCHAR(50) NOT NULL,
`idade` INT NOT NULL,
`plano_id` INT NOT NULL,
FOREIGN KEY (`plano_id`) REFERENCES `planos`(`plano_id`)
) engine = InnoDB;

CREATE TABLE `albuns` (
`album_id` INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
`album_nome` VARCHAR(100) NOT NULL,
`artista_id` INT NOT NULL,
FOREIGN KEY (`artista_id`) REFERENCES `artistas`(`artista_id`)
) engine = InnoDB;

CREATE TABLE `musicas` (
`musica_id` INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
`musica_nome` VARCHAR(200) NOT NULL,
`album_id` INT NOT NULL,
FOREIGN KEY (`album_id`) REFERENCES `albuns`(`album_id`)
) engine = InnoDB;

CREATE TABLE `seguidores` (
`usuario_id` INT NOT NULL,
`artista_id` INT NOT NULL,
PRIMARY KEY (`usuario_id`, `artista_id`),
FOREIGN KEY (`artista_id`) REFERENCES `artistas`(`artista_id`),
FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`usuario_id`)
) engine = InnoDB;

CREATE TABLE `historico_de_reproducoes` (
`usuario_id` INT NOT NULL,
`musica_id` INT NOT NULL,
PRIMARY KEY (`usuario_id`, `musica_id`),
FOREIGN KEY (`musica_id`) REFERENCES `musicas`(`musica_id`),
FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`usuario_id`)
) engine = InnoDB;

INSERT INTO artistas (artista_nome)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO planos (plano_nome, valor)
VALUES
('gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO usuarios (usuario_nome, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO albuns (album_nome, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO musicas (musica_nome, album_id)
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

INSERT INTO seguidores (usuario_id, artista_id)
VALUES 
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO historico_de_reproducoes (usuario_id, musica_id)
VALUES 
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 7),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
