DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN nome VARCHAR(100))
BEGIN 
SELECT n.artist_name artista,
a.album_name album
FROM SpotifyClone.album AS a
INNER JOIN SpotifyClone.artist AS n
ON n.artist_id = a.artist_id
WHERE n.artist_name = nome;
END 
$$ DELIMITER;
