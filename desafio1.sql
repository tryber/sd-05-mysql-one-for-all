DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
id INT PRIMARY KEY AUTO_INCREMENT,
plan_type VARCHAR(50) NOT NULL,
plan_price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE artists(
id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plans(id)
) engine = InnoDB;

CREATE TABLE albums(
id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(100) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artists(id)
) engine = InnoDB;

CREATE TABLE musics(
id INT PRIMARY KEY AUTO_INCREMENT,
music_name VARCHAR(200) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albums(id)
) engine = InnoDB;

CREATE TABLE music_history(
user_id INT NOT NULL,
music_id INT NOT NULL,
PRIMARY KEY (user_id, music_id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (music_id) REFERENCES musics(id)    
) engine = InnoDB;

CREATE TABLE followers(
user_id INT NOT NULL,
artist_id INT NOT NULL,
PRIMARY KEY (user_id, artist_id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (artist_id) REFERENCES artists(id)
) engine = InnoDB;

INSERT INTO plans (plan_type, plan_price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);
  
INSERT INTO artists (artist_name)
VALUES
 ('Walter Phoenix'),
 ('Peter Strong'),
 ('Lance Day'),
 ('Freedie Shannon');

INSERT INTO users (user_name, age, plan_id)
VALUES
 ('Thati', 23, 1),
 ('Cintia', 35, 2),
 ('Bill', 20, 3),
 ('Roger', 45, 1);
  
INSERT INTO albums (album_name, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO musics (music_name, album_id)
VALUES
("Soul For Us", 1),
("Reflections Of Magic", 1),
("Dance With Her Own", 1),
("Troubles Of My Inner Fire", 2),
("Time Fireworks", 2),
("Magic Circus", 3),
("Honey, So Do I", 3),
("Sweetie, Let's Go Wild", 3),
("She Knows", 3),
("Fantasy For Me", 4),
("Celebration Of More", 4),
("Rock His Everything", 4),
("Home Forever", 4),
("Diamond Power", 4),
("Honey, Let's Be Silly", 4),
("Thang Of Thunder", 5),
("Words Of Her Life", 5),
("Without My Streets", 5);

INSERT INTO music_history (user_id, music_id)
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
(4, 2),
(4, 18),
(4, 11);

INSERT INTO followers (user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
