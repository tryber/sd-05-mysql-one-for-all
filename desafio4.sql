CREATE VIEW top_3_artistas AS
SELECT
a.nome_artista AS 'artista',
COUNT(sa.usuario_id) AS 'seguidores'
FROM SpotifyClone.seguindo_artista AS sa
JOIN SpotifyClone.artistas AS a ON a.artista_id = sa.artista_id
GROUP BY `artista`
ORDER BY 2 DESC, 1 ASC
LIMIT 3;
