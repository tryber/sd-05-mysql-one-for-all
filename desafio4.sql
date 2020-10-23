CREATE VIEW top_3_artistas AS
SELECT ar.artista AS artista,
SUM(se.artistas_id = ar.id) AS seguidores
FROM SpotifyClone.artistas AS ar
JOIN SpotifyClone.seguindo_artistas AS se
ON(ar.id = se.artistas_id)
GROUP BY ar.artista, se.artistas_id
ORDER BY
SUM(se.artistas_id = ar.id) DESC,
ar.artista ASC
LIMIT 3;
