CREATE VIEW `top_3_artistas` AS
SELECT A.artista AS artista, COUNT(S.usuario_id) AS seguidores
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.seguindo AS S
ON A.id = S.artista_id
GROUP BY A.artista
ORDER BY seguidores DESC, artista
LIMIT 3;
