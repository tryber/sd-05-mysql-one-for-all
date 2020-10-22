-- Crie uma procedure chamada albuns_do_artista que recebe como parâmetro o nome de uma pessoa artista e em retorno deve exibir as seguintes colunas:
-- O nome da pessoa artista, com o alias "artista".
-- O nome do álbum, com o alias "album".
-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética

-- Ponto de atenção nos parâmetros deve ser indicado o tipo e usado com o WHERE
-- USE SpotifyClone;
-- CALL albuns_do_artista('Walter Phoenix');

DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN artista VARCHAR(100))
BEGIN
SELECT art.artista AS artista, alb.album AS album
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id
WHERE art.artista = artista
ORDER BY 2;
END $$
DELIMITER ;
