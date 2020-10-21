-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_plano` VARCHAR(45) NULL,
  `valor_plano` DECIMAL(5,2) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO plano(nome_plano, valor_plano)
	VALUES('gratuito', 0.00),
		('familiar', 7.99),
        ('universitário', 5.99);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(45) NULL,
  `idade` INT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`id`, `plano_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_usuario_plano_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_plano`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`plano` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO usuario(nome_usuario, idade, plano_id)
	VALUES('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);
    
-- -----------------------------------------------------
-- Table `SpotifyClone`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO artista(nome_artista)
	VALUE('Walter Phoenix'),
		('Peter Strong'),
        ('Lance Day'),
        ('Freedie Shannon');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id`, `artista_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_album_artista1_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO album(nome_album, artista_id)
	VALUES('Envious', 1),
		('Exuberant', 1),
        ('Hallowed Steam', 2),
        ('Incandescent', 3),
        ('Temporary Culture', 4);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_cancao` VARCHAR(45) NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cancao_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancao_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO cancao(nome_cancao, album_id)
	VALUES('Soul For Us', 1),
		('Reflections Of Magic', 1),
        ('Dance With Her Own', 1),
        ('Troubles Of My Inner Fire', 2),
        ('Time Fireworks', 2),
        ('Magic Circus', 3),
        ('Honey, So Do I', 3),
        ('Sweetie, Lets Go Wild', 3),
        ('She Knows', 3),
        ('Fantasy For Me', 4),
        ('Celebration Of More', 4),
        ('Rock His Everything', 4),
        ('Home Forever', 4),
        ('Diamond Power', 4),
        ('Honey, Lets Be Silly', 4),
        ('Thang Of Thunder', 5),
        ('Words Of Her Life', 5),
        ('Without My Streets', 5);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario_seguindo_artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario_seguindo_artista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_has_artista_artista1_idx` (`artista_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_artista_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_artista_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_artista_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO usuario_seguindo_artista(usuario_id, artista_id)
	VALUES(1, 1),
		(1, 4),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (3, 1),
        (4, 4);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_de_reproducoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_reproducoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_has_cancao_cancao1_idx` (`cancao_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_cancao_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_cancao_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_cancao_cancao1`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `SpotifyClone`.`cancao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO historico_de_reproducoes(usuario_id, cancao_id)
	VALUES(1, 1),
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
