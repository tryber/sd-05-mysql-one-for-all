DROP DATABASE IF EXISTS SpotifyClone;

create database SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
  PLANO_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  PLANO VARCHAR(20),
  VALOR_PLANO DECIMAL(5, 2)
);

CREATE TABLE usuario(
  USUARIO_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  USUARIO VARCHAR(50),
  IDADE INT,
  PLANO_ID INT,
  FOREIGN KEY(PLANO_ID) REFERENCES plano(PLANO_ID)
);

CREATE TABLE artista(
  ARTISTA_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NOME_ARTISTA VARCHAR(100)
);

CREATE TABLE album(
  ALBUM_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NAME_ALBUM VARCHAR(100),
  ARTISTA_ID INT,
  FOREIGN KEY(ARTISTA_ID) REFERENCES artista(ARTISTA_ID)
);

CREATE TABLE cancoes(
  CANCOES_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  CANCOES VARCHAR(100),
  ALBUM_ID INT,
  FOREIGN KEY(ALBUM_ID) REFERENCES album(ALBUM_ID)
);

CREATE TABLE historico(
  CANCOES_ID INT,
  USUARIO_ID INT,
  PRIMARY KEY(CANCOES_ID, USUARIO_ID),
  FOREIGN KEY(CANCOES_ID) REFERENCES cancoes(CANCOES_ID),
  FOREIGN KEY(USUARIO_ID) REFERENCES usuario(USUARIO_ID)
);

CREATE TABLE seguindo_artista(
    ARTISTA_ID INT,
    USUARIO_ID INT,
    PRIMARY KEY(ARTISTA_ID, USUARIO_ID),
    FOREIGN KEY(ARTISTA_ID) REFERENCES artista(ARTISTA_ID),
    FOREIGN KEY(USUARIO_ID) REFERENCES usuario(USUARIO_ID)
);

INSERT INTO plano (PLANO, VALOR_PLANO)
VALUES
('gratuito', 0),
('familiar',	7.99),
('universitário', 5.99);

INSERT INTO usuario (USUARIO, IDADE, PLANO_ID)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artista (NOME_ARTISTA)
VALUES
('Walter Phoenix'),
('Freedie Shannon'),
('Lance Day'),
('Peter Strong');

INSERT INTO album (NAME_ALBUM, ARTISTA_ID)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 4),
('Incandescent', 3),
('Temporary Culture', 2);

INSERT INTO cancoes (CANCOES, ALBUM_ID)
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

INSERT INTO historico (CANCOES_ID, USUARIO_ID)
VALUES
(1, 1),
(6, 1),
(14, 1),
(16, 1),
(13, 2),
(17, 2),
(2, 2),
(15, 2),
(4, 3),
(16, 3),
(6, 3),
(3, 4),
(18, 4),
(11, 4);

INSERT INTO seguindo_artista (ARTISTA_ID, USUARIO_ID)
VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(3, 2),
(4, 3),
(1, 3),
(2, 4);
