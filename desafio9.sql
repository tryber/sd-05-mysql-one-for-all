USE Spotifyclone;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(
	IN nome_do_artista VARCHAR(50)
)
BEGIN
	SELECT A.nome_artista AS artista, titulo_album AS album
    FROM SpotifyClone.artistas A
    INNER JOIN SpotifyClone.albuns AL
    ON A.id = AL.artista_id
    WHERE nome_artista = nome_do_artista
    ORDER BY album;
END $$
DELIMITER ;
