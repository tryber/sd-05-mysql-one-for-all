DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN artist VARCHAR(100))
BEGIN
SELECT
A.artista_nome artista,
AL.album_nome album
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.albuns AS AL ON AL.artista_id = A.artista_id
WHERE A.artista_nome = artist
ORDER BY AL.album_nome;
END;
$$ DELIMITER ;
