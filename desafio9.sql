DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN sArtist VARCHAR(40))
BEGIN
SELECT A.artist_name AS artista, ALB.album_name as album
FROM artists AS A  
INNER JOIN albums AS ALB ON A.artist_id = ALB.artist_id
WHERE sArtist LIKE A.artist_name
ORDER BY ALB.album_name;
END
$$ DELIMITER ;
