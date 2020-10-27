CREATE VIEW perfil_artistas AS
SELECT ar.nome AS artista,
al.titulo AS album,
COUNT(sa.usuario_id) AS seguidores
FROM artistas AS ar
INNER JOIN albuns AS al ON ar.artista_id = al.artista_id
INNER JOIN seguindo_artistas AS sa ON sa.artista_id = ar.artista_id
GROUP BY al.album_id
ORDER BY seguidores DESC, artista, album;

DROP VIEW perfil_artistas;
SELECT * FROM perfil_artistas;