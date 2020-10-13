CREATE VIEW perfil_artistas AS
SELECT ar.nome_artista AS artista,
al.nome_album AS album,
COUNT(sa.usuario_id) AS seguidores
FROM SpotifyClone.seguindo_artista AS sa
INNER JOIN SpotifyClone.artistas AS ar
ON sa.artista_id = ar.artista_id
INNER JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id
GROUP BY al.album_id
ORDER BY 3 DESC, 1, 2;
