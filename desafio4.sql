CREATE VIEW top_3_artistas AS
SELECT
artistas.artista AS artista,
COUNT(usuarios_artistas.usuario_id) AS seguidores
FROM SpotifyClone.usuarios_artistas
LEFT JOIN SpotifyClone.artistas ON SpotifyClone.usuarios_artistas.artista_id = SpotifyClone.artistas.id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;
