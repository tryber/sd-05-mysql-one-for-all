USE SpotifyClone;

DROP PROCEDURE IF EXISTS albuns_do_artista;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN nome_artista VARCHAR(50))
BEGIN
SELECT AR.artista AS 'artista', AL.album AS 'album'
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.albuns AS AL
WHERE AR.artista_id = AL.artista_id AND AR.artista = nome_artista;
END $$
DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
