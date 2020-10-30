CREATE VIEW top_3_artistas AS 
SELECT
a.name as artista,
COUNT(*) AS seguidores
FROM SpotifyClone.seguindo_artistas AS s, SpotifyClone.artista as a
WHERE s.artista_id = a.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista LIMIT 3;
