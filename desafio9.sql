-- Referência: query desenvolvida com a ajuda de Sidnei Ramos

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistaNome VARCHAR(50))
BEGIN
SELECT ar.nome AS artista,
al.título AS album
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.álbuns AS al
ON al.artista = ar.id
WHERE ar.nome = artistaNome;
END $$

DELIMITER ;
