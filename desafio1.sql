-- Dois jeitos de converter diagrams em SQL: ferramenta WorkBench (Database-Synchronize) ou na mão.
-- 1) CRIAR BANCO DE DADOS

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;


-- 2) CRIAR TABELAS COM SUAS COLUNAS E CONSTRAINTS

CREATE TABLE usuarios (
  -- também podemos escrever os nomes de tabelas e colunas com crases (`usuarios`, etc)
    usuario_id INT PRIMARY KEY AUTO_INCREMENT, -- com este PK, UNIQUE e NOT NULL é implicito
    usuario_nome VARCHAR(50) NOT NULL,
    usuario_idade INT NOT NULL,
    plano_id INT NOT NULL,
    -- PRIMARY KEY (usuario_id) -- outra linha onde podemos definir a chave primaria
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB; -- linha dada no repositorio do projeto

CREATE TABLE planos (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano_nome VARCHAR(50) NOT NULL,
    plano_valor DECIMAL(3,2) NOT NULL, -- qqr valor com 3 digitos e 2 decimais, entre -9.99 e 9.99
    -- ref. https://dev.mysql.com/doc/refman/8.0/en/fixed-point-types.html
) engine = InnoDB;

CREATE TABLE artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    -- todos ids no caso podiam ser também SMALLINT e TINYINT, sendo números baixos
    artista_nome VARCHAR(50) UNIQUE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE seguindo_artistas (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
	  PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
    -- CONSTRAINT nome_fk é um code que pode ser inserido no começo dessas linhas de FK
) engine = InnoDB;

CREATE TABLE cancoes (
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao_titulo VARCHAR(100) NOT NULL, -- mais carateres para titulos do que para nomes
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE albuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_titulo VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE historico_de_reproducoes (
    usuario_id NOT NULL,
    cancao_id NOT NULL,
    PRIMARY KEY (usuario_id, cancao_id)
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) engine = InnoDB;


-- 3) INSERIR VALORES NAS TABELAS

INSERT INTO usuarios (usuario_nome, usuario_idade, plano_id)
VALUES ('Thati', 23, 1), ('Cintia', 35, 3), ('Bill', 20, 2), ('Roger', 45, 1);

INSERT INTO planos (plano_nome, plano_valor)
VALUES ('gratuito', 0.00), ('universitário', 5.99), ('familiar', 7.99);

INSERT INTO artistas (artista_nome)
VALUES ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

INSERT INTO seguindo_artistas (usuario_id, artista_id)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

INSERT INTO cancoes (cancao_titulo, album_id)
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

INSERT INTO albuns (album_titulo, artista_id)
VALUES ('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4);

INSERT INTO historico_de_reproducoes (usuario_id, cancao_id)
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
