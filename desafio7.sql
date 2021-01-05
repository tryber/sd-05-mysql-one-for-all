CREATE VIEW perfil_artistas AS
SELECT art.artista AS artista,
album.album AS album,
COUNT(follow.usuario_id) AS seguidores
FROM SpotifyClone.seguindo_artistas AS follow
INNER JOIN SpotifyClone.artistas AS art
ON art.artista_id = follow.artista_id
INNER JOIN SpotifyClone.albuns AS album
ON album.artista_id = art.artista_id
GROUP BY album.album, art.artista
ORDER BY seguidores DESC, artista, album;
