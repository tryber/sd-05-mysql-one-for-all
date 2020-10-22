DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN nome VARCHAR(100))
BEGIN
SELECT a.nome_artista artista,
al.nome_album album
FROM SpotifyClone.albuns AS al
INNER JOIN SpotifyClone.artistas AS a
ON a.artista_id = al.artista_id
WHERE a.nome_artista = nome;
END
$$ DELIMITER ;
