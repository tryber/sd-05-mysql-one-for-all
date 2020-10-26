DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN nome_artista VARCHAR(100))
BEGIN 
SELECT S.artista AS artista , A.album AS album FROM SpotifyClone.artistas AS S
JOIN SpotifyClone.albuns AS A ON A.artistas_artist_id = S.artist_id
WHERE artista = nome_artista;
END $$
DELIMITER ;
