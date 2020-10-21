CREATE VIEW top_3_artistas AS
SELECT art.nome_artista AS artista,
COUNT(seg.usuario_id) AS seguidores
FROM SpotifyClone.seguidores AS seg
INNER JOIN SpotifyClone.artistas AS art
ON art.artista_id = seg.artista_id
GROUP BY art.artista_id
ORDER BY 2 DESC, 1 LIMIT 3;
