DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN art VARCHAR(50))
BEGIN 
SELECT ar.artist_name AS artista,
album_name AS album
FROM SpotifyClone.albuns AS al
INNER JOIN SpotifyClone.artists AS ar
ON al.artist_id = ar.artist_id
WHERE ar.artist_name = art;
END $$
DELIMITER ;
