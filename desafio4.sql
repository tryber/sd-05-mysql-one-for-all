CREATE VIEW top_3_artistas AS
SELECT a.nome AS artista,
COUNT(u.nome) AS seguidores FROM artistas AS a
INNER JOIN seguindo_artistas AS sa ON sa.artista_id = a.artista_id
INNER JOIN usuarios AS u ON u.usuario_id = sa.usuario_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;
