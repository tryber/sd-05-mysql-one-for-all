DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(45))
BEGIN
    SELECT (SELECT ar.artista FROM SpotifyClone.artistas AS ar WHERE al.artista_id = ar.artista_id) AS artista,
    al.album AS album
    FROM SpotifyClone.albuns AS al
    WHERE (SELECT ar.artista FROM SpotifyClone.artistas AS ar WHERE al.artista_id = ar.artista_id) = nome_artista
    ORDER BY album;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
