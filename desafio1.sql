DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

## criando tabelas 

CREATE TABLE IF NOT EXISTS SpotifyClone.planos (
plano_id INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(50) NOT NULL,
valor FLOAT4 NOT NULL,
CONSTRAINT PRIMARY KEY (plano_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.artista (
artista_id INT NOT NULL AUTO_INCREMENT,
nome  VARCHAR(50) NOT NULL,
CONSTRAINT PRIMARY KEY (artista_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.album (
album_id INT NOT NULL AUTO_INCREMENT,
nome  VARCHAR(50) NOT NULL,
artista_id INT,
CONSTRAINT FOREIGN KEY(artista_id) REFERENCES SpotifyClone.artista(artista_id),
CONSTRAINT PRIMARY KEY (album_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.cancao (
cancao_id INT NOT NULL AUTO_INCREMENT,
album_id INT,
nome VARCHAR(50) NOT NULL,
CONSTRAINT FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id),
PRIMARY KEY (cancao_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.usuario (
usuario_id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano_id INT,
CONSTRAINT FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id),
CONSTRAINT PRIMARY KEY (usuario_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.seguidos (
usuario_id INT NOT NULL,
artista_id INT NOT NULL, 
CONSTRAINT FOREIGN KEY  (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
CONSTRAINT FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id),
CONSTRAINT PRIMARY KEY (usuario_id, artista_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.reproducao (
usuario_id INT,
cancao_id INT,
CONSTRAINT FOREIGN KEY  (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
CONSTRAINT FOREIGN KEY  (cancao_id) REFERENCES SpotifyClone.cancao(cancao_id),
CONSTRAINT PRIMARY KEY (usuario_id, cancao_id) 
);

## populando tabela

INSERT INTO SpotifyClone.planos (descricao, valor)
VALUES ('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO SpotifyClone.artista (nome)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO SpotifyClone.album (nome, artista_id)
VALUES ('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO SpotifyClone.cancao (nome, album_id)
VALUES ('Soul For Us', 1),
('Dance With Her Own', 1),
('Reflections Of Magic', 1),
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
('Honey, Let''s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO SpotifyClone.usuario (nome, idade, plano_id)
VALUES ('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO SpotifyClone.seguidos (usuario_id, artista_id)
VALUES  (1,	1),
(1,	3),
(1,	4),
(2,	1),
(2,	3),
(3,	1),
(3,	2),
(4,	4);

INSERT INTO SpotifyClone.reproducao (usuario_id, cancao_id)
VALUES  (1,	1),
(1,	6),
(1,	14),
(1,	16),
(2,	13),
(2,	17),
(2,	3),
(2,	15),
(3,	6),
(3,	16),
(3,	4),
(4,	2),
(4,	18),
(4,	11);
