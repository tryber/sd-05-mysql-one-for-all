DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `planos`(
    `plano_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `nome_plano` VARCHAR(100) NOT NULL,
    `valor` DECIMAL(5,2) NOT NULL,
    CONSTRAINT `pk_plano_id` PRIMARY KEY (`plano_id`)
) engine = InnoDB;

CREATE TABLE `usuarios`(
    `usuario_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `nome_usuario` VARCHAR(100) NOT NULL,
    `idade` INT NOT NULL,
    `plano_id` INT NOT NULL,
    CONSTRAINT `pk_usuario_id` PRIMARY KEY (`usuario_id`),
    CONSTRAINT `fk_plano_id_usuario` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`plano_id`)
) engine = InnoDB;

CREATE TABLE `artistas`(
    `artista_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `nome_artista` VARCHAR(100) NOT NULL,
    CONSTRAINT `pk_artista_id` PRIMARY KEY (`artista_id`)
) engine = InnoDB;

CREATE TABLE `albuns`(
    `album_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `nome_album` VARCHAR(100) NOT NULL,
    CONSTRAINT `pk_album_id` PRIMARY KEY (`album_id`)
) engine = InnoDB;

CREATE TABLE `cancoes`(
    `cancao_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `cancao_nome` VARCHAR(100) NOT NULL,
    `album_id` INT NOT NULL,
    CONSTRAINT `pk_cancao_id` PRIMARY KEY (`cancao_id`),
    CONSTRAINT `fk_album_id_cancao` FOREIGN KEY (`album_id`) REFERENCES `albuns` (`album_id`)
) engine = InnoDB;

CREATE TABLE `artista_cancao`(
    `artista_cancao_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `artista_id` INT NOT NULL,
    `cancao_id` INT NOT NULL,
    CONSTRAINT `pk_artista_cancao_id` PRIMARY KEY (`artista_cancao_id`),
    CONSTRAINT `fk_artista_id_cancao` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`artista_id`),
    CONSTRAINT `fk_cancao_id_artista` FOREIGN KEY (`cancao_id`) REFERENCES `cancoes` (`cancao_id`)
) engine = InnoDB;

CREATE TABLE `seguindo_artista`(
    `seguindo_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `usuario_id` INT NOT NULL,
    `artista_id` INT NOT NULL,
    CONSTRAINT `pk_seguindo_id` PRIMARY KEY (`seguindo_id`),
    CONSTRAINT `fk_usuario_id_artista` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
    CONSTRAINT `fk_artista_id_usuario` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`artista_id`)
) engine = InnoDB;

CREATE TABLE `reproducao`(
    `reproducao_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
    `usuario_id` INT NOT NULL,
    `cancao_id` INT NOT NULL,
    CONSTRAINT `pk_reproducao_id` PRIMARY KEY (`reproducao_id`),
    CONSTRAINT `fk_usuario_id_cancao` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
    CONSTRAINT `fk_cancao_id_usuario` FOREIGN KEY (`cancao_id`) REFERENCES `cancoes` (`cancao_id`)
) engine = InnoDB;

INSERT INTO planos (nome_plano, valor)
VALUES
('gratuito', 0.00),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO usuarios (nome_usuario, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artistas (nome_artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns (nome_album)
VALUES
('Envious'),
('Exuberant'),
('Hallowed Steam'),
('Incandescent'),
('Temporary Culture');

INSERT INTO cancoes (cancao_nome, album_id)
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
('Words OF Her Life', 5),
('Without My Streets', 5);

INSERT INTO artista_cancao (artista_id, cancao_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(4, 16),
(4, 17),
(4, 18);

INSERT INTO seguindo_artista (usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO reproducao (usuario_id, cancao_id)
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
