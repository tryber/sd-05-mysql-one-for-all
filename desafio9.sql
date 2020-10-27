DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista_escolhido VARCHAR(100))
BEGIN
SELECT ar.nome AS artista,
al.titulo AS album
FROM artistas AS ar
INNER JOIN albuns AS al ON al.artista_id = ar.artista_id
WHERE ar.nome = artista_escolhido
ORDER BY album; 
END $$ 
DELIMITER ;
