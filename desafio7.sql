CREATE VIEW perfil_artistas AS
SELECT ar.artista AS artista,
al.album AS album,
COUNT(sa.usuario_id) AS seguidores
FROM SpotifyClone.seguindo_artistas AS sa
INNER JOIN SpotifyClone.artistas AS ar
ON ar.artista_id = sa.artista_id
INNER JOIN SpotifyClone.albuns AS al
ON al.artista_id = ar.artista_id
GROUP BY al.album, ar.artista
ORDER BY seguidores DESC, artista, album;