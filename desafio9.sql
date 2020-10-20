USE SpotifyClone;
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
