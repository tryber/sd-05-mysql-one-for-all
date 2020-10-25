CREATE OR REPLACE VIEW SpotifyClone.top_3_artistas AS
SELECT art.nome AS artista, COUNT(seg.usuario_id) AS seguidores
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.seguidos AS seg
ON seg.artista_id = art.artista_id
GROUP BY 1
ORDER BY 2 DESC, 1 ASC
LIMIT 3;
