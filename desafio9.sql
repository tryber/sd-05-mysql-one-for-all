-- USE SpotifyClone;
-- DROP PROCEDURE albuns_do_artista;
-- CALL albuns_do_artista('Walter Phoenix');

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(50))
BEGIN
SELECT a.artist_name AS 'artista',
alb.album_name AS 'album'
FROM SpotifyClone.artists AS a
JOIN SpotifyClone.albums AS alb ON alb.artist_id = a.id
WHERE a.artist_name = nome
ORDER BY `album`;
END $$
DELIMITER ;
