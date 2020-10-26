DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN art VARCHAR(40))
BEGIN
SELECT ar.artista_nome AS artista, 
album AS album
FROM SpotifyClone.Artista as ar
JOIN SpotifyClone.Album AS alb
ON ar.artista_id = alb.artista_id
WHERE ar.artista_nome = art;
END
$$ DELIMITER ;

-- CALL albuns_do_artista('Walter Phoenix');
