DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN art VARCHAR(50))
BEGIN
SELECT ar.nome_artista AS artista,
nome_album AS album
FROM SpotifyClone.albuns AS al
INNER JOIN SpotifyClone.artistas AS ar
ON al.artista_id = ar.artista_id
WHERE ar.nome_artista = art;
END $$
DELIMITER ;
