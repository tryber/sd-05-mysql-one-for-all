CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `users` (
  `user_id` UNIQUE INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NULL,
  `user_age` INT(11) NULL,
  `plan_id` INT NOT NULL,
  CONSTRAINT `fk_users_plans1`
  FOREIGN KEY (`plan_id`)
  REFERENCES `SpotifyClone`.`plans` (`plan_id`)
) ENGINE = InnoDB;

CREATE TABLE `plans` (
  `plan_id` INT NOT NULL AUTO_INCREMENT,
  `plan_name` VARCHAR(45) NOT NULL,
  `plan_value` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`plan_id`);
) ENGINE = InnoDB;

CREATE TABLE `artists` (
  `artist_id` UNIQUE INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE = innoDB;

CREATE TABLE `albuns` (
  `album_id` UNIQUE INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `fk_albuns_artists1`
  FOREIGN KEY (`artist_id`)
  REFERENCES `SpotifyClone`.`artists` (`artist_id`)
) ENGINE = innoDB;

CREATE TABLE `historic` (
  `historic_id` UNIQUE INT NOT NULL AUTO_INCREMENT,
  `song_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY(`user_id`, `song_id`),
  CONSTRAINT `fk_historic_songs1`
    FOREIGN KEY (`song_id`)
    REFERENCES `SpotifyClone`.`songs` (`song_id`)
  CONSTRAINT `fk_historic_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`)
) ENGINE = InnoDB;

CREATE TABLE `follower` (
  `follow_id` UNIQUE INT NOT NULL AUTO_INCREMENT,
  `artist_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY(`artist_id`, `user_id`)
  CONSTRAINT `fk_follower_artists1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artist` (`artist_id`)
  CONSTRAINT `fk_follower_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`)
) ENGINE = InnoDB;

CREATE TABLE `songs` (
  `song_id` UNIQUE INT NOT NULL AUTO_INCREMENT,
  `album_id` INT NOT NULL,
  `song_name` VARCHAR(45) NULL,
  PRIMARY KEY (`song_id`)
  CONSTRAINT `fk_songs_albuns1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`album_id`)
) ENGINE = InnoDB;

INSERT INTO users (user_name, user_age, plan_id)
VALUES 
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);


INSERT INTO plans (plan_name, plan_value)
VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO artists (artist_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns (album_name, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO songs (song_name, album_id)
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
('Words OF Her Life', 5),
('Without My Streets', 5);

INSERT INTO follower (user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO historic (user_id, song_id)
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
