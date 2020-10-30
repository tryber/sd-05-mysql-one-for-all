DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN pessoaArtista VARCHAR(50))
BEGIN
SELECT a.NOME_ARTISTA AS 'artista', alb.NAME_ALBUM AS 'album'
FROM SpotifyClone.album AS alb
INNER JOIN artista AS a
ON a.ARTISTA_ID = alb.ARTISTA_ID
WHERE a.NOME_ARTISTA = pessoaArtista
ORDER BY alb.NAME_ALBUM;
END
$$ DELIMITER ;
