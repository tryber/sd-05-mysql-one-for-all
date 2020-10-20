CREATE VIEW top_3_artistas AS
SELECT 
A.artista_nome AS artista,
COUNT(S.artista_id) AS seguidores
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.seguidores AS S ON S.artista_id = A.artista_id
GROUP BY artista;
