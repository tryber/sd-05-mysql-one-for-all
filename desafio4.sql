CREATE VIEW top_3_artistas AS
SELECT a.nome AS artista, COUNT(*) AS seguidores FROM SpotifyClone.seguidores AS s
INNER JOIN SpotifyClone.artistas AS a
ON a.id = s.artista
GROUP BY a.id
ORDER BY `seguidores` DESC, a.nome
LIMIT 3;
