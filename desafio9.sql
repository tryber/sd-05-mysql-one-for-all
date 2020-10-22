DELIMITER $$
CREATE PROCEDURE albuns_do_artista(in param char(30))
BEGIN
SELECT artista, album from artistas
inner join albuns
on artistas.artistaId = albuns.artistaId
WHERE artistas.artista = param;
END
$$
DELIMITER ;
