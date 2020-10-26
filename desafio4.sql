CREATE VIEW top_3_artistas AS
SELECT A.artista AS artista, COUNT(usuario_id) AS seguidores FROM SpotifyClone.artistas AS A
JOIN SpotifyClone.seguindo_artista AS S ON S.artist_id = A.artist_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;
