DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;


CREATE TABLE IF NOT EXISTS `planos`(
    `id` TINYINT NOT NULL AUTO_INCREMENT,
    `tipo_plano` VARCHAR(15) NOT NULL DEFAULT 'gratuito',
    `valor_plano` DECIMAL(5, 2) NULL DEFAULT 0.00,
    PRIMARY KEY(`id`)
) engine = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `usuarios`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome_usuario` VARCHAR(50) NULL DEFAULT NULL,
    `idade` TINYINT NULL DEFAULT NULL,
    `plano_id` TINYINT NULL DEFAULT NULL,
    PRIMARY KEY(`id`),
    CONSTRAINT `fk_tipos_planos`
    FOREIGN KEY (`plano_id`)
    REFERENCES `planos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) engine = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE IF NOT EXISTS `artistas`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome_artista` VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY(`id`)
) engine = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `albuns`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `titulo_album` VARCHAR(50) NULL DEFAULT NULL,
    `artista_id` INT NULL DEFAULT NULL,
    PRIMARY KEY(`id`),
    CONSTRAINT `fk_nomes_artistas`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) engine = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `musicas`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `cançoes` VARCHAR(50) NULL DEFAULT NULL,
    `album_id` INT NULL DEFAULT NULL,
    PRIMARY KEY(`id`),
  CONSTRAINT `fk_nomes_albuns`
  FOREIGN KEY (`album_id`)
  REFERENCES `SpotifyClone`.`albuns` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
) engine = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `histórico_de_reproduçoes`(
    `usuario_id` INT NOT NULL,
    `cançao_id` INT NOT NULL,
    PRIMARY KEY(`usuario_id`, `cançao_id`),
    CONSTRAINT `fk_nomes_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_nomes_cançoes`
    FOREIGN KEY (`cançao_id`)
    REFERENCES `SpotifyClone`.`musicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) engine = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `seguidores`(
    `usuario_id` INT NOT NULL,
    `artista_id` INT NOT NULL,
    PRIMARY KEY(`usuario_id`, `artista_id`),
    CONSTRAINT `fk_nomes_usuarios_seguidores`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_nomes_artistas_seguidores`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) engine = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `planos` (`id`,`tipo_plano`,`valor_plano`) 
VALUES
(null ,DEFAULT, DEFAULT ),
(null,'familiar', 7.99 ),
(null,'universitário',5.99);

INSERT INTO `usuarios` (`id`,`nome_usuario`,`idade`, `plano_id`) 
VALUES
(NULL ,'Thati', 23, 1 ),
(NULL,'Cintia', 35, 2 ),
(NULL,'Bill', 20, 3),
(NULL, 'Roger', 45, 1);

INSERT INTO `artistas` (`id`,`nome_artista`) 
VALUES
(NULL ,'Walter Phoenix'),
(NULL,'Peter Strong'),
(NULL,'Lance Day'),
(NULL, 'Freedie Shannon');

SELECT * FROM MUSICAS;

INSERT INTO `albuns` (`id`,`titulo_album`, `artista_id`) 
VALUES
(NULL ,'Envious', 1),
(NULL,'Exuberant', 1),
(NULL,'Hallowed Steam', 2),
(NULL, 'Incandescent', 3),
(NULL, 'Temporary Culture', 4);

INSERT INTO `musicas` (`id`,`cançoes`, `album_id`) 
VALUES
(NULL ,'Soul For Us', 1),
(NULL ,'Troubles Of My Inner Fire', 2),
(NULL ,'Magic Circus', 3),
(NULL ,'Fantasy For Me', 4),
(NULL ,'Thang Of Thunder', 4),
(NULL ,'Reflections Of Magic', 1),
(NULL ,'Dance With Her Own', 1),
(NULL ,'Time Fireworks', 2),
(NULL ,'Honey, So Do I', 3),
(NULL ,'Sweetie, Let\'s Go Wild', 3),
(NULL ,'She Knows', 3),
(NULL ,'Celebration Of More', 4),
(NULL ,'Rock His Everything', 4),
(NULL ,'Home Forever', 4),
(NULL ,'Diamond Power', 4),
(NULL ,'Honey, Let\'s Be Silly', 4),
(NULL ,'Words Of Her Life', 5),
(NULL ,' Without My Streets', 5);

INSERT INTO `histórico_de_reproduçoes` (`usuario_id`,`cançao_id`) 
VALUES
(1, 1),
(1, 3),
(1, 15),
(1, 5),
(2, 14),
(2, 17),
(2, 6),
(3, 2),
(3, 3),
(3, 5),
(4, 7),
(4, 12),
(4, 18);

INSERT INTO `seguidores` (`usuario_id`,`artista_id`) 
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

SELECT * FROM musicas;
