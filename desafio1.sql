DROP SCHEMA IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone DEFAULT CHARACTER SET utf8 ;
USE SpotifyClone ;

-- -----------------------------------------------------
-- Table SpotifyClone.plano
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.plano (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  valor DECIMAL(4,2) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table SpotifyClone.usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.usuario (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_usuario_plano1_idx (plano_id ASC) VISIBLE,
  CONSTRAINT fk_usuario_plano1
    FOREIGN KEY (plano_id)
    REFERENCES SpotifyClone.plano (id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table SpotifyClone.artista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.artista (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table SpotifyClone.album
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.album (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_album_artista_idx (artista_id ASC) VISIBLE,
  CONSTRAINT fk_album_artista
    FOREIGN KEY (artista_id)
    REFERENCES SpotifyClone.artista (id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table SpotifyClone.cancoes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.cancoes (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_cancoes_artista1_idx (album_id ASC) VISIBLE,
  CONSTRAINT fk_cancoes_artista1
    FOREIGN KEY (album_id)
    REFERENCES SpotifyClone.album (id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table SpotifyClone.historico_de_reproducao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.historico_de_reproducao (
  usuario_id INT NOT NULL,
  cancoes_id INT NOT NULL,
  INDEX fk_historico_de_reproducao_usuario1_idx (usuario_id ASC) VISIBLE,
  INDEX fk_historico_de_reproducao_cancoes1_idx (cancoes_id ASC) VISIBLE,
  CONSTRAINT fk_historico_de_reproducao_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES SpotifyClone.usuario (id),
  CONSTRAINT fk_historico_de_reproducao_cancoes1
    FOREIGN KEY (cancoes_id)
    REFERENCES SpotifyClone.cancoes (id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table SpotifyClone.seguindo_artista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.seguindo_artista (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  INDEX fk_seguindo_artista_usuario1_idx (usuario_id ASC) VISIBLE,
  INDEX fk_seguindo_artista_artista1_idx (artista_id ASC) VISIBLE,
  CONSTRAINT fk_seguindo_artista_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES SpotifyClone.usuario (id),
  CONSTRAINT fk_seguindo_artista_artista1
    FOREIGN KEY (artista_id)
    REFERENCES SpotifyClone.artista (id))
ENGINE = InnoDB;


INSERT INTO plano(nome, valor) VALUES
('gratuito', 0.00),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO usuario(nome, idade, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artista(nome) VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO album(nome, artista_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancoes(nome, album_id) VALUES
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

INSERT INTO historico_de_reproducao(usuario_id, cancoes_id) VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 2),
(2, 13),
(2, 15),
(2, 17),
(3, 4),
(3, 6),
(3, 16),
(4, 3),
(4, 11),
(4, 18);

INSERT INTO seguindo_artista(usuario_id, artista_id) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);
