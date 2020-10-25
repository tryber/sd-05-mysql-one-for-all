DELIMITER $$
CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN Art VARCHAR(50))
BEGIN
SELECT 
art.nome AS artista,
alb.nome AS album
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON art.artista_id = alb.artista_id
WHERE Art LIKE art.nome
ORDER BY 2;
END
