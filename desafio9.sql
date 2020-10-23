-- Crie uma procedure chamada albuns_do_artista que recebe como parâmetro o nome de uma pessoa artista e em retorno deve exibir as seguintes colunas:
-- O nome da pessoa artista, com o alias "artista".
-- O nome do álbum, com o alias "album".
-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.
-- Confirme a execução correta da procedure, chamando-a e passando o nome igual a "Walter Phoenix". Sua procedure deve retornar o mesmo que o resultado abaixo:
-- CALL albuns_do_artista('Walter Phoenix');

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(100))
BEGIN
SELECT art.artist_name AS 'artista',
alb.album_title AS 'album'
FROM SpotifyClone.artists AS art
JOIN SpotifyClone.albums AS alb ON alb.artist_id = art.artist_id
WHERE art.artist_name = artista
ORDER BY `album`;
END $$
DELIMITER ;
