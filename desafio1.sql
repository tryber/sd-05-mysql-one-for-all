DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone ;
USE SpotifyClone ;
CREATE TABLE IF NOT EXISTS planos (
  id_plano INT AUTO_INCREMENT,
  plano VARCHAR(45) NULL,
  valor_plano DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id_plano)
)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS usuarios (
  usuario_id INT AUTO_INCREMENT,
  usuario VARCHAR(45) NOT NULL,
  idade INT NULL,
  planos_id_plano INT NOT NULL,
  PRIMARY KEY (usuario_id),
  CONSTRAINT fk_usuarios_planos
    FOREIGN KEY (planos_id_plano)
    REFERENCES planos (id_plano)
)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS artistas (
  artist_id INT NOT NULL,
  artista VARCHAR(99) NOT NULL,
  PRIMARY KEY (artist_id)
)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS albuns (
  album_id INT NOT NULL,
  album VARCHAR(100) NULL,
  artistas_artist_id INT NOT NULL,
  PRIMARY KEY (album_id),
  CONSTRAINT fk_albuns_artistas1
    FOREIGN KEY (artistas_artist_id)
    REFERENCES artistas (artist_id)
)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS cancoes (
  id_cancao INT AUTO_INCREMENT,
  cancao VARCHAR(50) NOT NULL,
  albuns_album_id INT NOT NULL,
  PRIMARY KEY (id_cancao),
  CONSTRAINT fk_cancoes_albuns1
    FOREIGN KEY (albuns_album_id)
    REFERENCES albuns (album_id)
)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS reproducao (
  usuarios_usuario_id INT NOT NULL,
  cancoes_id_cancao INT NOT NULL,
  PRIMARY KEY (cancoes_id_cancao, usuarios_usuario_id),
  CONSTRAINT fk_usuarios_has_cancoes_usuarios1
    FOREIGN KEY (usuarios_usuario_id)
    REFERENCES usuarios (usuario_id),
  CONSTRAINT fk_usuarios_has_cancoes_cancoes1
    FOREIGN KEY (cancoes_id_cancao)
    REFERENCES cancoes (id_cancao)
)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS seguindo_artista (
  usuario_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artist_id),
  CONSTRAINT fk_usuarios_has_artistas_usuarios1
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios (usuario_id),
  CONSTRAINT fk_usuarios_has_artistas_artistas1
    FOREIGN KEY (artist_id)
    REFERENCES artistas (artist_id)
)
ENGINE = InnoDB;
INSERT INTO planos (plano, valor_plano)
VALUES
('gratuito',  0),
('familiar',  7.99),
('universitário', 5.99);
INSERT INTO usuarios (usuario,idade,planos_id_plano)
VALUES
('Thati',23,1),
('Cintia',35,2),
('Bill',20,3),
('Roger',45,1);
INSERT INTO artistas (artist_id,artista)
VALUES
(1,'Walter Phoenix'),
(2,'Peter Strong'),
(3,'Lance Day'),
(4,'Freedie Shannon');
INSERT INTO albuns (album_id,album,artistas_artist_id)
VALUES
(1,'Envious',1),
(2,'Exuberant',1),
(3,'Hallowed Steam',2),
(4,'Incandescent',3),
(5,'Temporary Culture',4);
INSERT INTO cancoes (cancao,albuns_album_id)
VALUES
('Soul For Us',1),
('Reflections Of Magic',1),
('Dance With Her Own',1),
('Troubles Of My Inner Fire',2),
('Time Fireworks',2),
('Magic Circus',3),
('Honey, So Do I',3),
("Sweetie, Let's Go Wild",3),
('She Knows',3),
('Fantasy For Me',4),
('Celebration Of More',4),
('Rock His Everything',4),
('Home Forever',4),
('Diamond Power',4),
("Honey, Let's Be Silly",4),
('Thang Of Thunder',5),
('Words Of Her Life',5),
('Without My Streets',5);
INSERT INTO reproducao (usuarios_usuario_id,cancoes_id_cancao)
VALUES
(1,1),
(1,6),
(1,14),
(1,16),
(2,13),
(2,17),
(2,2),
(2,15),
(3,4),
(3,16),
(3,6),
(4,2),
(4,18),
(4,11);
INSERT INTO seguindo_artista (usuario_id,artist_id)
VALUES
(1,1),
(1,4),
(1,3),
(2,1),
(2,3),
(3,1),
(3,2),
(4,4);