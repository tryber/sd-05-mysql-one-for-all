CREATE VIEW top_3_artistas AS
SELECT A.artista AS 'artista', COUNT(S.artista_id) AS 'seguidores'
FROM SpotifyClone.artistas AS A 
INNER JOIN SpotifyClone.seguidores AS S	
ON A.artista_id = S.artista_id
GROUP BY A.artista_id
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
