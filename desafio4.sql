CREATE VIEW top_3_artistas AS
SELECT A.nome_artista AS 'artista' , COUNT(*) AS 'seguidores'
FROM SpotifyClone.seguidores S
INNER JOIN SpotifyClone.artistas A
ON A.id = S.artista_id
INNER JOIN SpotifyClone.usuarios U
ON U.id = S.usuario_id
GROUP BY S.artista_id
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
