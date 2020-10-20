#DROP VIEW IF EXISTS top_3_artistas;
CREATE VIEW top_3_artistas AS
SELECT art.artista AS artista, COUNT(*) AS seguidores FROM SpotifyClone.seguidores AS seg
JOIN SpotifyClone.artistas AS art
ON art.id = seg.id_artista
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

SELECT * FROM top_3_artistas;
