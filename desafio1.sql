DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE artists (
artist_id INT(4) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
artist_name VARCHAR(30) NOT NULL
) engine = InnoDB;

CREATE TABLE albums (
album_id INT(4) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
album_name VARCHAR(30) NOT NULL,
artist_id INT(4) UNSIGNED NOT NULL, 
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE songs (
song_id INT(4) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
song_name VARCHAR(50) NOT NULL,
album_id INT(4) UNSIGNED NOT NULL,
FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE plans (
plan_id INT(2) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
plan_name VARCHAR(30) NOT NULL,
plan_price DOUBLE NOT NULL 
) engine = InnoDB;

CREATE TABLE users (
user_id INT(4) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(30) NOT NULL,
age INT(3) NOT NULL,
plan_id INT(2) UNSIGNED NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) engine = InnoDB;

CREATE TABLE followers  (
artist_id INT(4) UNSIGNED NOT NULL,
user_id INT(4) UNSIGNED NOT NULL,
PRIMARY KEY (artist_id, user_id),
FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
) engine = InnoDB;

CREATE TABLE listenning_history (
song_id INT(4) UNSIGNED NOT NULL,
user_id INT(4) UNSIGNED NOT NULL,
PRIMARY KEY (song_id, user_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
) engine = InnoDB;

-- Inserindo os planos
INSERT INTO plans (plan_name, plan_price)
values
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

-- Inserindo os usuários
INSERT INTO users (user_name, age, plan_id)
VALUES 
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

-- Inserindo artistas
INSERT INTO artists (artist_name)
VALUES
('Walter Phoenix'),
('Freedie Shannon'),
('Lance Day'),
('Peter Strong');

-- Inserindo albums
INSERT INTO albums (album_name, artist_id)
VALUES
('Envious',1),
('Exuberant',1),
('Hallowed Steam',4),
('Incandescent',3),
('Temporary Culture',2);

-- Inserindo músicas
INSERT INTO songs (song_name, album_id)
VALUES
('Soul For Us',1),
('Reflections Of Magic',1),
('Dance With Her Own', 1),
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

-- Inserindo histórico de reproduções
INSERT INTO listenning_history (user_id, song_id)
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
(4,3),
(4,18),
(4,11);

-- Inserindo relação de seguidores com autor
INSERT INTO followers (user_id, artist_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,1),
(3,4),
(4,2);
