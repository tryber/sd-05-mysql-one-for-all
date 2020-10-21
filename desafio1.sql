CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;
CREATE TABLE artistas(
artista_id INT PRIMARY KEY auto_increment,
artista VARCHAR(50)
)engine=InnoDB;

CREATE TABLE album(
album_id INT PRIMARY KEY auto_increment,
album VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) references artistas(artista_id)
)engine=InnoDB;

CREATE TABLE musica(
musica_id INT PRIMARY KEY auto_increment,
musica VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (album_id) references album(album_id),
FOREIGN KEY (artista_id) references artista(artista_id)
)engine=InnoDB;

CREATE TABLE planos(
plano_id INT PRIMARY KEY auto_increment,
plano VARCHAR(100) NOT NULL,
valor_plano DECIMAL(4,2) NOT NULL
)engine=InnoDB;

CREATE TABLE usuarios(
usuario_id INT PRIMARY KEY auto_increment,
usuario VARCHAR(100) NOT NULL,
idade VARCHAR(100) NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) references planos(plano_id)
)engine=InnoDB;

CREATE TABLE historico(
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
CONSTRAINT PK_historico PRIMARY KEY (usuario_id, musica_id),
FOREIGN KEY (usuario_id) references usuarios(usuario_id),
FOREIGN KEY (musica_id) references musica(musica_id)
)engine=InnoDB;

CREATE TABLE seguindo(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT PK_seguindo PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id) references usuarios(usuario_id),
FOREIGN KEY (artista_id) references artistas(artista_id)
)engine=InnoDB;

INSERT INTO SpotifyClone.artistas (artista) VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO SpotifyClone.album (album, artista_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO SpotifyClone.planos (plano, valor_plano) VALUES
('gratuito', '0'),
('familiar', '7.99'),
('universitário', '5.99');

INSERT INTO SpotifyClone.usuarios (usuario, idade, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 23, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO musica (musica, album_id, artista_id) VALUES
('Soul For Us', 1, 1),
('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 2, 1),
('Time Fireworks', 2, 1),
('Magic Circus', 3, 2),
('Honey, So Do I', 3, 2),
('Sweetie, Lets Go Wild', 3, 2),
('She Knows', 3, 2),
('Fantasy For Me', 4, 3),
('Celebration Of More', 4, 3),
('Rock His Everything', 4, 3),
('Home Forever', 4, 3),
('Diamond Power', 4, 3),
('Honey, Lets Be Silly', 4, 3),
('Thang Of Thunder', 5, 4),
('Words Of Her Life', 5, 4),
('Without My Streets', 5, 4);

INSERT INTO seguindo (usuario_id, artista_id) VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO historico (usuario_id, musica_id) VALUES
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
