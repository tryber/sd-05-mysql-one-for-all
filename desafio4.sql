CREATE VIEW top_3_artistas AS
SELECT a.nome_artista AS artista,
COUNT(sa.usuario_id) AS seguidores
FROM SpotifyClone.seguindo_artista AS sa
INNER JOIN SpotifyClone.artistas AS a
ON sa.artista_id = a.artista_id
GROUP BY sa.artista_id
ORDER BY 2 DESC, 1
LIMIT 3;
