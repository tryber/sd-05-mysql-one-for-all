DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE usuarios(
    id INT PRIMARY KEY auto_increment,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(id)
) engine = InnoDB;

CREATE TABLE planos(
    id INT PRIMARY KEY auto_increment,
    plano VARCHAR(50) NOT NULL,
    valor_plano DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE artistas(
    id INT PRIMARY KEY auto_increment,
    artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
    id INT PRIMARY KEY auto_increment,
    album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(id)
) engine = InnoDB;

CREATE TABLE cancoes(
    id INT PRIMARY KEY auto_increment,
    cancao VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(id),
    FOREIGN KEY (album_id) REFERENCES albuns(id)
) engine = InnoDB;

CREATE TABLE usuarios_artistas(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (artista_id) REFERENCES artistas(id)
) engine = InnoDB;

CREATE TABLE usuarios_cancoes(
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(id)
) engine = InnoDB;


INSERT INTO usuarios (usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);

INSERT INTO planos (plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('universitario', 5.99),
  ('familiar', 7.99);

INSERT INTO artistas (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO usuarios_artistas (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

INSERT INTO albuns (album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO cancoes (cancao, artista_id, album_id)
VALUES
  ("Soul For Us", 1, 1),
  ("Reflections Of Magic", 1, 1),
  ("Dance With Her Own", 1, 1),
  ("Troubles Of My Inner Fire", 1, 2),
  ("Time Fireworks", 1, 2),
  ("Magic Circus", 2, 3),
  ("Honey, So Do I", 2, 3),
  ("Sweetie, Let's Go Wild", 2, 3),
  ("She Knows", 2, 3),
  ("Fantasy For Me", 3, 4),
  ("Celebration Of More", 3, 4),
  ("Rock His Everything", 3, 4),
  ("Home Forever", 3, 4),
  ("Diamond Power", 3, 4),
  ("Honey, Let's Be Silly", 3, 4),
  ("Thang Of Thunder", 4, 5),
  ("Words Of Her Life", 4, 5),
  ("Without My Streets", 4, 5);

INSERT INTO usuarios_cancoes (usuario_id, cancao_id)
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
