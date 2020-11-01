/* SELECT a.artista AS artista, COUNT(*) AS seguidores 
FROM SpotifyClone.seguindo_artistas AS sa
INNER JOIN SpotifyClone.artistas AS a
ON a.artista_id = sa.artista_id
GROUP BY a.artista_id
ORDER BY seguidores DESC
LIMIT 3; 
Tem custo de 2.06 em relação aos 0.65 da subquery */

CREATE VIEW top_3_artistas AS
SELECT a.artista AS artista,
(SELECT COUNT(*) FROM SpotifyClone.seguindo_artistas AS sa WHERE a.artista_id = sa.artista_id) AS seguidores 
FROM SpotifyClone.artistas AS a
ORDER BY seguidores DESC, artista
LIMIT 3;
