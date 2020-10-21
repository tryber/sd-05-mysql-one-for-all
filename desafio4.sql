CREATE VIEW top_3_artistas AS
SELECT 
a.nome AS artista,
COUNT(f.usuario_id) AS seguidores
FROM SpotifyClone.follow AS f
JOIN SpotifyClone.artist as a
ON f.artist_id = a.id
GROUP BY a.nome
ORDER BY 2 DESC, 1
LIMIT 3;
