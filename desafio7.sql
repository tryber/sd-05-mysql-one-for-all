CREATE VIEW perfil_artistas AS
SELECT
ar.name as `artista`,
al.name as `album`,
COUNT(*) AS `seguidores`
FROM SpotifyClone.seguindo_artistas AS sa, SpotifyClone.artista as ar, SpotifyClone.album AS al
WHERE sa.artista_id = ar.artista_id AND ar.artista_id = al.artista_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;
