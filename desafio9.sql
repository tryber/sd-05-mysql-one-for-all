-- Crie uma procedure chamada albuns_do_artista que recebe como parâmetro
-- o nome de uma pessoa artista e em retorno deve exibir as seguintes colunas:
-- O nome da pessoa artista, com o alias "artista".
-- O nome do álbum, com o alias "album".
-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.

-- USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(50))
BEGIN
  SELECT
  art.artista_nome AS 'artista',
  alb.album_titulo AS 'album'
  FROM SpotifyClone.albuns AS alb
  JOIN SpotifyClone.artistas AS art
  ON art.artista_id = alb.artista_id
  WHERE art.artista_nome = nomeArtista;
END $$

DELIMITER ;

-- CALL albuns_do_artista('Walter Phoenix'); -- retorno certo no WorkBench
