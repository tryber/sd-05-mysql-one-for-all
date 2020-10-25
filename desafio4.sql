CREATE VIEW top_3_artistas AS
SELECT ar.artista AS artista,
COUNT(*) AS seguidores
FROM SpotifyClone.artistas AS ar
JOIN SpotifyClone.seguindo_artistas AS se
ON(ar.id = se.artistas_id)
GROUP BY ar.artista, se.artistas_id
ORDER BY
`seguidores` DESC,
ar.artista ASC
LIMIT 3;
