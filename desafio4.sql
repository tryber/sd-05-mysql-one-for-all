SELECT
ar.name as `artista`,
COUNT(*) AS `seguidores`
FROM SpotifyClone.seguindo_artistas AS sa, SpotifyClone.artista as ar
WHERE sa.artista_id = ar.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`  LIMIT 3;
