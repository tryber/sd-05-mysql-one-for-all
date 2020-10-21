SELECT
artistas.artista AS artista,
albuns.album AS album,
COUNT(usuarios_artistas.usuario_id) AS seguidores
FROM SpotifyClone.albuns
JOIN SpotifyClone.artistas ON SpotifyClone.artistas.id = SpotifyClone.albuns.artista_id
JOIN SpotifyClone.usuarios_artistas ON SpotifyClone.usuarios_artistas.artista_id = SpotifyClone.artistas.id
GROUP BY album, artista
ORDER BY seguidores DESC, artista, album;
