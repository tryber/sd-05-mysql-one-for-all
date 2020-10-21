-- Referência: https://www.w3schools.com/sql/sql_datatypes.asp
-- Referência: https://www.w3schools.com/sql/sql_foreignkey.asp
-- Referência: https://stackoverflow.com/questions/635937/how-do-i-specify-unique-constraint-for-multiple-columns-in-mysql
-- Referência: https://www.w3schools.com/sql/sql_insert_into_select.asp

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    id INT AUTO_INCREMENT,
    tipo VARCHAR(20),
    preço DOUBLE(5, 2),
    PRIMARY KEY(id)
) engine = InnoDB;

CREATE TABLE artistas(
    id INT AUTO_INCREMENT,
    nome VARCHAR(50),
    PRIMARY KEY(id)
) engine = InnoDB;

CREATE TABLE álbuns(
    id INT AUTO_INCREMENT,
    título VARCHAR(50),
    artista INT,
    PRIMARY KEY(id),
    FOREIGN KEY (artista) REFERENCES artistas(id)
) engine = InnoDB;

CREATE TABLE canções(
    id INT AUTO_INCREMENT,
    álbum INT,
    título VARCHAR(50),
    PRIMARY KEY(id), FOREIGN KEY (álbum) REFERENCES álbuns(id)
) engine = InnoDB;

CREATE TABLE usuários(
    id INT AUTO_INCREMENT,
    nome VARCHAR(50),
    plano INT,
    idade INT,
    PRIMARY KEY(id),
    FOREIGN KEY (plano) REFERENCES planos(id)
) engine = InnoDB;

CREATE TABLE reproduções(
    id INT AUTO_INCREMENT,
    usuário INT,
    canção INT,
    PRIMARY KEY(id),
    FOREIGN KEY (usuário) REFERENCES usuários(id),
    FOREIGN KEY (canção) REFERENCES canções(id),
    UNIQUE `reprodução_index` (`usuário`, `canção`)
) engine = InnoDB;

CREATE TABLE seguidores(
    id INT AUTO_INCREMENT,
    usuário INT, artista INT, 
    PRIMARY KEY(id), FOREIGN KEY (usuário) REFERENCES usuários(id), FOREIGN KEY (artista) REFERENCES artistas(id),
    UNIQUE `seguidor_index` (`usuário`, `artista`)
) engine = InnoDB;

INSERT INTO planos (tipo, preço)
VALUES
('gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO artistas (nome)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO álbuns (título, artista)
VALUES
('Envious', (SELECT id FROM artistas WHERE artistas.nome = 'Walter Phoenix')),
('Exuberant', (SELECT id FROM artistas WHERE artistas.nome = 'Walter Phoenix')),
('Hallowed Steam', (SELECT id FROM artistas WHERE artistas.nome = 'Peter Strong')),
('Incandescent', (SELECT id FROM artistas WHERE artistas.nome = 'Lance Day')),
('Temporary Culture', (SELECT id FROM artistas WHERE artistas.nome = 'Freedie Shannon'));

INSERT INTO canções (álbum, título)
VALUES
((SELECT id FROM álbuns WHERE álbuns.título = 'Envious'), 'Soul For Us'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Envious'), 'Reflections Of Magic'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Envious'), 'Dance With Her Own'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Exuberant'), 'Troubles Of My Inner Fire'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Exuberant'), 'Time Fireworks'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Hallowed Steam'), 'Magic Circus'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Hallowed Steam'), 'Honey, So Do I'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Hallowed Steam'), "Sweetie, Let's Go Wild"),
((SELECT id FROM álbuns WHERE álbuns.título = 'Hallowed Steam'), 'She Knows'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Incandescent'), 'Fantasy For Me'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Incandescent'), 'Celebration Of More'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Incandescent'), 'Rock His Everything'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Incandescent'), 'Home Forever'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Incandescent'), 'Diamond Power'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Incandescent'), "Honey, Let's Be Silly"),
((SELECT id FROM álbuns WHERE álbuns.título = 'Temporary Culture'), 'Thang Of Thunder'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Temporary Culture'), 'Words Of Her Life'),
((SELECT id FROM álbuns WHERE álbuns.título = 'Temporary Culture'), 'Without My Streets');
  
INSERT INTO usuários (nome, plano, idade)
VALUES
('Thati', (SELECT id FROM planos WHERE planos.tipo = 'gratuito'), 23),
('Cintia', (SELECT id FROM planos WHERE planos.tipo = 'familiar'), 35),
('Bill', (SELECT id FROM planos WHERE planos.tipo = 'universitário'), 20),
('Roger', (SELECT id FROM planos WHERE planos.tipo = 'gratuito'), 45);

INSERT INTO reproduções (usuário, canção)
VALUES
((SELECT id FROM usuários WHERE usuários.nome = 'Thati'), (SELECT id FROM canções WHERE canções.título = 'Soul For Us')),
((SELECT id FROM usuários WHERE usuários.nome = 'Thati'), (SELECT id FROM canções WHERE canções.título = 'Magic Circus')),
((SELECT id FROM usuários WHERE usuários.nome = 'Thati'), (SELECT id FROM canções WHERE canções.título = 'Diamond Power')),
((SELECT id FROM usuários WHERE usuários.nome = 'Thati'), (SELECT id FROM canções WHERE canções.título = 'Thang Of Thunder')),
((SELECT id FROM usuários WHERE usuários.nome = 'Cintia'), (SELECT id FROM canções WHERE canções.título = 'Home Forever')),
((SELECT id FROM usuários WHERE usuários.nome = 'Cintia'), (SELECT id FROM canções WHERE canções.título = 'Words Of Her Life')),
((SELECT id FROM usuários WHERE usuários.nome = 'Cintia'), (SELECT id FROM canções WHERE canções.título = 'Reflections Of Magic')),
((SELECT id FROM usuários WHERE usuários.nome = 'Cintia'), (SELECT id FROM canções WHERE canções.título = "Honey, Let's Be Silly")),
((SELECT id FROM usuários WHERE usuários.nome = 'Bill'), (SELECT id FROM canções WHERE canções.título = 'Troubles Of My Inner Fire')),
((SELECT id FROM usuários WHERE usuários.nome = 'Bill'), (SELECT id FROM canções WHERE canções.título = 'Thang Of Thunder')),
((SELECT id FROM usuários WHERE usuários.nome = 'Bill'), (SELECT id FROM canções WHERE canções.título = 'Magic Circus')),
((SELECT id FROM usuários WHERE usuários.nome = 'Roger'), (SELECT id FROM canções WHERE canções.título = 'Dance With Her Own')),
((SELECT id FROM usuários WHERE usuários.nome = 'Roger'), (SELECT id FROM canções WHERE canções.título = 'Without My Streets')),
((SELECT id FROM usuários WHERE usuários.nome = 'Roger'), (SELECT id FROM canções WHERE canções.título = 'Celebration Of More'));

INSERT INTO seguidores (usuário, artista)
VALUES
((SELECT id FROM usuários WHERE usuários.nome = 'Thati'), (SELECT id FROM artistas WHERE artistas.nome = 'Walter Phoenix')),
((SELECT id FROM usuários WHERE usuários.nome = 'Thati'), (SELECT id FROM artistas WHERE artistas.nome = 'Freedie Shannon')),
((SELECT id FROM usuários WHERE usuários.nome = 'Thati'), (SELECT id FROM artistas WHERE artistas.nome = 'Lance Day')),
((SELECT id FROM usuários WHERE usuários.nome = 'Cintia'), (SELECT id FROM artistas WHERE artistas.nome = 'Walter Phoenix')),
((SELECT id FROM usuários WHERE usuários.nome = 'Cintia'), (SELECT id FROM artistas WHERE artistas.nome = 'Lance Day')),
((SELECT id FROM usuários WHERE usuários.nome = 'Bill'), (SELECT id FROM artistas WHERE artistas.nome = 'Peter Strong')),
((SELECT id FROM usuários WHERE usuários.nome = 'Bill'), (SELECT id FROM artistas WHERE artistas.nome = 'Walter Phoenix')),
((SELECT id FROM usuários WHERE usuários.nome = 'Roger'), (SELECT id FROM artistas WHERE artistas.nome = 'Freedie Shannon'));
