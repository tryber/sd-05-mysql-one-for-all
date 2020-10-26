CREATE VIEW top_3_artistas AS
SELECT A.nome_artista AS artista, COUNT(*) AS seguidores
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.usuario_seguindo_artista AS USA
ON A.id = USA.artista_id
GROUP BY A.nome_artista, USA.artista_id
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
