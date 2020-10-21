DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
planoId INT(4) PRIMARY KEY AUTO_INCREMENT NOT NULL,
plano varchar(30) NOT NULL,
valor DECIMAL(3,2)
) engine = InnoDB;

CREATE TABLE artistas(
artistaId int(4) PRIMARY KEY AUTO_INCREMENT NOT NULL,
artista varchar(50) NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
usuarioId int(4) PRIMARY KEY AUTO_INCREMENT NOT NULL,
usuario varchar(100) NOT NULL,
idade INT(3) NOT NULL,
planoId INT(3) NOT NULL,
FOREIGN KEY (planoId) REFERENCES planos(planoId)
) engine = InnoDB;

CREATE TABLE seguidores (
artistaId int(4),
seguidorId int(4),
PRIMARY KEY (artistaId, seguidorId),
FOREIGN KEY (artistaId) REFERENCES artistas(artistaId),
FOREIGN KEY (seguidorId) REFERENCES usuarios(usuarioId)
) engine = innoDB;

CREATE TABLE albuns(
albumId int(4) PRIMARY KEY AUTO_INCREMENT NOT NULL,
album varchar(50),
artistaId int(4) NOT NULL,
FOREIGN KEY (artistaId) REFERENCES artistas(artistaId)
) engine = InnoDB;

CREATE TABLE cancoes(
cancaoId int(4) PRIMARY KEY AUTO_INCREMENT NOT NULL,
cancao varchar(100) NOT NULL,
albumId int(4),
FOREIGN KEY (albumId) REFERENCES albuns(albumId)
) engine = innoDB;

CREATE TABLE historico_de_reproducoes(
usuario_id int(4),
cancao_id int(4),
PRIMARY KEY (usuario_id, cancao_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuarioId),
FOREIGN KEY (cancao_id) REFERENCES cancoes(cancaoId)
) engine = innoDB;

INSERT INTO planos (planoId, plano, valor)
VALUES
('1', 'Gratuito', 0),
('2', 'Familiar', 7.99),
('3', 'Universitario', 5.99);

INSERT INTO artistas (artistaId, artista)
VALUES
('1', 'Walter Phoenix'),
('2', 'Peter Strong'),
('3', 'Lance Day'),
('4', 'Freedie Shannon');

INSERT INTO albuns (albumId, album, artistaId)
VALUES
('1', 'Envious', 1),
('2', 'Exuberant', 1),
('3', 'Hallowed Steam', 2),
('4', 'Incandescent', 3),
('5', 'Temporary Culture', 4);

INSERT INTO cancoes (cancaoId, cancao, albumId)
VALUES
('1', 'Soul For Us', '1'),
('2', 'Reflections Of Magic', '1'),
('3', 'Dance With Her Own', '1'),
('4', 'Troubles Of My Inner Fire', '2'),
('5', 'Time Fireworks', '2'),
('6', 'Magic Circus', '3'),
('7', 'Honey, So Do I', '3'),
('8', "Sweetie, Let's Go Wild", '3'),
('9', 'She Knows', '3'),
('10', 'Fantasy For Me', '4'),
('11', 'Celebration Of More', '4'),
('12', 'Rock His Everything', '4'),
('13', 'Home Forever', '4'),
('14', 'Diamond Power', '4'),
('15', "Honey, Let's Be Silly", '4'),
('16', 'Thang Of Thunder', '5'),
('17', 'Words Of Her Life', '5'),
('18', 'Without My Streets', '5');

INSERT INTO usuarios (usuarioId, usuario, idade, planoId)
VALUES
('1', 'Thati', '23', '1'),
('2', 'Cintia', '35', '2'),
('3', 'Bill', '20', '3'),
('4', 'Roger', '45', '1');

INSERT INTO historico_de_reproducoes (usuario_id, cancao_id)
VALUES
('1', '1'),
('1', '6'),
('1', '14'),
('1', '16'),
('2', '13'),
('2', '17'),
('2', '2'),
('2', '15'),
('3', '4'),
('3', '16'),
('3', '6'),
('4', '3'),
('4', '18'),
('4', '11');

INSERT INTO seguidores (artistaId, seguidorId)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(3, 1),
(3, 2),
(4, 1),
(4, 4);
