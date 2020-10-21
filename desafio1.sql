-- Criando um banco novo
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
-- Criando as tabelas necessárias
USE SpotifyClone;
CREATE TABLE IF NOT EXISTS artista (
  artista_id INT NOT NULL AUTO_INCREMENT,
  artista_nome VARCHAR(50) NOT NULL,
  CONSTRAINT PK_artista PRIMARY KEY (artista_id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS album (
  album_id INT AUTO_INCREMENT,
  album_nome VARCHAR(50) NOT NULL,
  artista_id INT,
  CONSTRAINT PK_album PRIMARY KEY(album_id),
  CONSTRAINT FK_album_artista_id FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS cancao (
  cancao_id INT NOT NULL AUTO_INCREMENT,
  cancao_nome VARCHAR(50) NOT NULL,
  album_id INT,
  CONSTRAINT PK_cancao PRIMARY KEY(cancao_id),
  CONSTRAINT FK_cancao_album_id FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS plano (
  plano_id INT NOT NULL AUTO_INCREMENT,
  plano_descricao VARCHAR(50) NOT NULL,
  plano_valor DOUBLE NOT NULL,
  CONSTRAINT PK_plano PRIMARY KEY(plano_id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS usuario (
  usuario_id INT NOT NULL AUTO_INCREMENT,
  usuario_nome VARCHAR(50) NOT NULL,
  usuario_idade INT NOT NULL,
  plano_id INT,
  CONSTRAINT PK_usuario PRIMARY KEY(usuario_id),
  CONSTRAINT FK_usuario_plano_id FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS historico_reproducao (
  usuario_id INT,
  cancao_id INT,
  CONSTRAINT PK_historico_reproducao PRIMARY KEY(usuario_id, cancao_id),
  CONSTRAINT FK_historico_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
  CONSTRAINT FK_historico_cancao_id FOREIGN KEY (cancao_id) REFERENCES cancao (cancao_id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS usuario_artista (
  usuario_id INT,
  artista_id INT,
  CONSTRAINT PK_usuario_artista PRIMARY KEY(usuario_id, artista_id),
  CONSTRAINT PK_historico_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
  CONSTRAINT PK_historico_artista_id FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) ENGINE = InnoDB;
-- Populando as tabelas
INSERT INTO artista (artista_nome)
VALUES ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong'),
  ('Walter Phoenix');
INSERT INTO album (album_nome)
VALUES ('Envious'),
  ('Exuberant'),
  ('Hallowed Steam'),
  ('Incandescent'),
  ('Temporary Culture');
INSERT INTO cancao (cancao_nome)
VALUES ('Soul For Us'),
  ('Troubles Of My Inner Fire'),
  ('Magic Circus'),
  ('Fantasy For Me'),
  ('Thang Of Thunder'),
  ('Reflections Of Magic'),
  ('Time Fireworks'),
  ('Honey, So Do I'),
  ('Celebration Of More'),
  ('Words Of Her Life'),
  ('Dance With Her Own'),
  ("Sweetie, Let's Go Wild"),
  ('Rock His Everything'),
  ('Without My Streets'),
  ('She Knows'),
  ('Home Forever'),
  ('Diamond Power'),
  ('Honey, Let''s Be Silly');
INSERT INTO plano (plano_descricao, plano_valor)
VALUES ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);
INSERT INTO usuario (usuario_nome, usuario_idade)
VALUES ('Thati', 23),
  ('Cintia', 35),
  ('Bill', 20),
  ('Roger', 45);
-- Atualizando o álbum da canção
UPDATE cancao
SET album_id = (
    SELECT alb.album_id
    FROM album AS alb
    WHERE alb.album_nome = 'Envious'
  )
WHERE cancao_nome IN (
    "Soul For Us",
    "Reflections Of Magic",
    "Dance With Her Own"
  );
UPDATE cancao
SET album_id = (
    SELECT alb.album_id
    FROM album AS alb
    WHERE alb.album_nome = 'Exuberant'
  )
WHERE cancao_nome IN ("Troubles Of My Inner Fire", "Time Fireworks");
UPDATE cancao
SET album_id = (
    SELECT alb.album_id
    FROM album AS alb
    WHERE alb.album_nome = 'Hallowed Steam'
  )
WHERE cancao_nome IN (
    "Magic Circus",
    "Honey, So Do I",
    'Sweetie, Let''s Go Wild',
    "She Knows"
  );
UPDATE cancao
SET album_id = (
    SELECT alb.album_id
    FROM album AS alb
    WHERE alb.album_nome = 'Incandescent'
  )
WHERE cancao_nome IN (
    "Fantasy For Me",
    "Celebration Of More",
    "Rock His Everything",
    "Home Forever",
    "Diamond Power",
    'Honey, Let''s Be Silly'
  );
UPDATE cancao
SET album_id = (
    SELECT alb.album_id
    FROM album AS alb
    WHERE alb.album_nome = 'Temporary Culture'
  )
WHERE cancao_nome IN (
    "Thang Of Thunder",
    "Words Of Her Life",
    "Without My Streets"
  );
-- Atualizando o artista do album
UPDATE album
SET artista_id = (
    SELECT src.artista_id
    FROM artista AS src
    WHERE src.artista_nome = 'Walter Phoenix'
  )
WHERE album_nome IN ('Envious', 'Exuberant');
UPDATE album
SET artista_id = (
    SELECT src.artista_id
    FROM artista AS src
    WHERE src.artista_nome = 'Peter Strong'
  )
WHERE album_nome IN ('Hallowed Steam');
UPDATE album
SET artista_id = (
    SELECT src.artista_id
    FROM artista AS src
    WHERE src.artista_nome = 'Lance Day'
  )
WHERE album_nome IN ('Incandescent');
UPDATE album
SET artista_id = (
    SELECT src.artista_id
    FROM artista AS src
    WHERE src.artista_nome = 'Freedie Shannon'
  )
WHERE album_nome IN ('Temporary Culture');
-- Atualizando o plano do usuário
UPDATE usuario
SET plano_id = (
    SELECT src.plano_id
    FROM plano AS src
    WHERE src.plano_descricao = 'gratuito'
  )
WHERE usuario_nome IN ('Thati', 'Roger');
UPDATE usuario
SET plano_id = (
    SELECT src.plano_id
    FROM plano AS src
    WHERE src.plano_descricao = 'familiar'
  )
WHERE usuario_nome IN ('Cintia');
UPDATE usuario
SET plano_id = (
    SELECT src.plano_id
    FROM plano AS src
    WHERE src.plano_descricao = 'universitário'
  )
WHERE usuario_nome IN ('Bill');
-- Propulando historico_reproducao
INSERT INTO historico_reproducao (usuario_id, cancao_id)
SELECT usr.usuario_id,
  can.cancao_id
FROM (
    SELECT usuario_id
    FROM usuario
    WHERE usuario.usuario_nome = 'Thati'
  ) as usr,
  (
    SELECT cancao_id
    FROM cancao
    WHERE cancao.cancao_nome IN (
        "Soul For Us",
        "Magic Circus",
        "Diamond Power",
        "Thang Of Thunder"
      )
  ) AS can;
INSERT INTO historico_reproducao (usuario_id, cancao_id)
SELECT usr.usuario_id,
  can.cancao_id
FROM (
    SELECT usuario_id
    FROM usuario
    WHERE usuario.usuario_nome = 'Cintia'
  ) as usr,
  (
    SELECT cancao_id
    FROM cancao
    WHERE cancao.cancao_nome IN (
        "Home Forever",
        "Words Of Her Life",
        "Reflections Of Magic",
        'Honey, Let''s Be Silly'
      )
  ) AS can;
INSERT INTO historico_reproducao (usuario_id, cancao_id)
SELECT usr.usuario_id,
  can.cancao_id
FROM (
    SELECT usuario_id
    FROM usuario
    WHERE usuario.usuario_nome = 'Bill'
  ) as usr,
  (
    SELECT cancao_id
    FROM cancao
    WHERE cancao.cancao_nome IN (
        "Troubles Of My Inner Fire",
        "Thang Of Thunder",
        "Magic Circus"
      )
  ) AS can;
INSERT INTO historico_reproducao (usuario_id, cancao_id)
SELECT usr.usuario_id,
  can.cancao_id
FROM (
    SELECT usuario_id
    FROM usuario
    WHERE usuario.usuario_nome = 'Roger'
  ) as usr,
  (
    SELECT cancao_id
    FROM cancao
    WHERE cancao.cancao_nome IN (
        "Dance With Her Own",
        "Without My Streets",
        "Celebration Of More"
      )
  ) AS can;
-- Populando usuario_artista
INSERT INTO usuario_artista (usuario_id, artista_id)
SELECT src1.id,
  src2.id
FROM (
    SELECT usuario_id AS id
    FROM usuario
    WHERE usuario.usuario_nome = 'Thati'
  ) as src1,
  (
    SELECT artista_id AS id
    FROM artista
    WHERE artista.artista_nome IN ("Walter Phoenix", "Freedie Shannon", "Lance Day")
  ) AS src2
UNION
SELECT src1.id,
  src2.id
FROM (
    SELECT usuario_id AS id
    FROM usuario
    WHERE usuario.usuario_nome = 'Cintia'
  ) as src1,
  (
    SELECT artista_id AS id
    FROM artista
    WHERE artista.artista_nome IN ("Walter Phoenix", "Lance Day")
  ) AS src2
UNION
SELECT src1.id,
  src2.id
FROM (
    SELECT usuario_id AS id
    FROM usuario
    WHERE usuario.usuario_nome = 'Bill'
  ) as src1,
  (
    SELECT artista_id AS id
    FROM artista
    WHERE artista.artista_nome IN ("Peter Strong", "Walter Phoenix")
  ) AS src2
UNION
SELECT src1.id,
  src2.id
FROM (
    SELECT usuario_id AS id
    FROM usuario
    WHERE usuario.usuario_nome = 'Roger'
  ) as src1,
  (
    SELECT artista_id AS id
    FROM artista
    WHERE artista.artista_nome IN ("Freedie Shannon")
  ) AS src2;
