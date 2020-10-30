-- desafio 9
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR
(50))
BEGIN
    SELECT
        ar.name AS artista,
        al.name
    AS album
FROM SpotifyClone.album AS al, SpotifyClone.artista AS ar
WHERE al.artista_id = ar.artista_id
AND ar.name = artista
ORDER BY album;
END $$
DELIMITER ;
