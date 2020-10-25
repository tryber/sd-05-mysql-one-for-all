CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE Usuário(
usuario_id INT PRIMARY KEY auto_increment,
usuario VARCHAR(30) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
foreign key (plano_id) references Plano(plano_id)
) engine = InnoDB;

INSERT into Usuário(usuario, idade, plano_id)
  VALUES ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

CREATE TABLE Album(
album_id INT primary key auto_increment,
album VARCHAR(30) not null,
artista_id INT not null,
FOREIGN KEY(artista_id) references Artista(artista_id)
) engine = InnoDB;
INSERT INTO Album(album, artista_id)
  VALUES ('Envious', 1 ),
  ('Exuberant', 1 ),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

CREATE TABLE Plano(
plano_id INT primary key auto_increment,
plano VARCHAR(15) not null,
valor_plano DECIMAL(3,2)
) engine = InnoDB;
INSERT INTO Plano(plano, valor_plano)
  VALUES ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);
 
 CREATE TABLE Artista(
 artista_id INT primary key auto_increment,
 artista_nome VARCHAR(15) NOT NULL
 ) engine = InnoDB;
 INSERT INTO Artista(artista_nome)
  VALUES ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

CREATE TABLE Canções(
cancoes_id INT primary key auto_increment,
cancoes VARCHAR(30) not null,
album_id INT not null,
FOREIGN KEY(album_id) references Album(album_id)
) engine = InnoDB;
INSERT INTO Canções(cancoes, album_id)
  VALUES ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ("Fantasy For Me", 4),
  ("Celebration Of More", 4),
  ("Rock His Everything", 4),
  ("Home Forever", 4),
  ("Diamond Power", 4),
  ("Honey, Let's Be Silly", 4),
  ("Thang Of Thunder", 5),
  ("Words Of Her Life", 5),
  ("Without My Streets", 5);

CREATE TABLE Historico(
cancoes_id INT NOT NULL,
usuario_id INT NOT NULL,
PRIMARY KEY(cancoes_id, usuario_id),
FOREIGN KEY(cancoes_id) references Canções(cancoes_id),
FOREIGN KEY(usuario_id) references Usuário(usuario_id)
) engine = InnoDB;
INSERT INTO Historico(cancoes_id, usuario_id)
  VALUES (1, 1),
  (6, 1),
  (14, 1),
  (16, 1),
  (13, 2),
  (17, 2),
  (2,2),
  (7,2),
  (4,3),
  (16,3),
  (6,3),
  (3,4),
  (18,4),
  (11,4);

CREATE TABLE Seguidores(
artista_id INT NOT NULL,
usuario_id INT NOT NULL,
PRIMARY KEY(usuario_id, artista_id),
FOREIGN KEY(artista_id) references Artista(artista_id),
FOREIGN KEY(usuario_id) references Usuário(usuario_id)
) engine = InnoDB;
INSERT INTO Seguidores(artista_id, usuario_id)
  VALUES (1, 1),
  (4,1),
  (3,1),
  (1,2),
  (3,2),
  (2,3),
  (1,3),
  (4,4);
 