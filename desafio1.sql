create database SpotifyClone;
use SpotifyClone;

CREATE TABLE planos (
id SMALLINT auto_increment,
plano VARCHAR(40) NOT NULL,
valor_plano decimal(5,2) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO SpotifyClone.planos (plano, valor_plano) VALUES
('gratuito', 0),
('familiar', 7.99),
('universitario', 5.99);

CREATE TABLE artistas (
id SMALLINT auto_increment,
artista VARCHAR(40) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO artistas (artista) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE albuns (
id SMALLINT auto_increment,
album VARCHAR(40) NOT NULL,
id_artista SMALLINT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_artista) REFERENCES artistas(id)
);

INSERT INTO albuns (album, id_artista) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE usuarios (
id SMALLINT auto_increment,
usuario VARCHAR(40) NOT NULL,
idade SMALLINT NOT NULL,
id_plano SMALLINT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_plano) REFERENCES planos(id)
);

INSERT INTO SpotifyClone.usuarios (usuario, idade, id_plano) VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

CREATE TABLE cancoes (
id SMALLINT auto_increment,
cancao VARCHAR(60) NOT NULL,
id_artista SMALLINT NOT NULL,
id_album SMALLINT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_artista) REFERENCES artistas(id),
FOREIGN KEY (id_album) REFERENCES albuns(id)
);

INSERT INTO cancoes (cancao, id_artista, id_album) VALUES
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

CREATE TABLE historico (
id_usuario SMALLINT NOT NULL,
id_cancao SMALLINT NOT NULL,
PRIMARY KEY (id_usuario, id_cancao),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_cancao) REFERENCES cancoes(id)
);

INSERT INTO historico (id_usuario, id_cancao) VALUES
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

CREATE TABLE seguidores (
PRIMARY KEY (id_usuario, id_artista),
id_usuario SMALLINT NOT NULL,
id_artista SMALLINT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_artista) REFERENCES artistas(id)
);

INSERT INTO seguidores (id_usuario, id_artista) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);


