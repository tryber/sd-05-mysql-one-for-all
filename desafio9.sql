USE SpotifyClone;
DROP PROCEDURE IF EXISTS albuns_do_artista;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN SINGER VARCHAR(50))
BEGIN
SELECT art.artista AS artista,
alb.album AS album
FROM artistas AS art
JOIN albuns AS alb
ON art.id = alb.id_artista
WHERE artista LIKE SINGER;
END $$
DELIMITER ;
#CALL albuns_do_artista('Walter Phoenix');
