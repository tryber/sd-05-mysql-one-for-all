DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `plan`(
  `plan_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
  `plan_name` VARCHAR(100) NOT NULL,
  `cost` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`plan_id`)
)
ENGINE = InnoDB;

CREATE TABLE `user`(
  `user_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
  `user_name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_plan_user_id` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`plan_id`) 
)
ENGINE = InnoDB;

CREATE TABLE `artist`(
  `artist_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
  `artist_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`artist_id`)
)
ENGINE = InnoDB;

CREATE TABLE `album`(
  `album_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
  `album_name` VARCHAR(100) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `fk_artist_id_album` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`)
)
ENGINE = InnoDB;

CREATE TABLE `song`(
  `song_id` INT UNIQUE AUTO_INCREMENT NOT NULL,
  `song_name` VARCHAR(100) NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`song_id`),
  CONSTRAINT `fk_album_id_song` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`)
)
ENGINE = InnoDB;

CREATE TABLE `follow_artist`(
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  CONSTRAINT `fk_user_id_artist` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_artist_id_user` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`))
ENGINE = InnoDB;

CREATE TABLE `reproduction`(
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `song_id`),
  CONSTRAINT `fk_user_id_song` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_song_id_user` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`))
ENGINE = InnoDB;

INSERT INTO plan (plan_name, cost)
VALUES
('gratuito', 0.00),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO user (user_name, age, plan_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artist (artist_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO album (album_name, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO song (song_name, album_id)
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

INSERT INTO follow_artist (user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO reproduction (user_id, song_id)
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
