CREATE VIEW perfil_artistas AS
SELECT
art.artista AS artista,
a.album AS album
COUNT(*) AS seguidores
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS a
ON a.artistas_id = art.id
INNER JOIN SpotifyClone.seguindo_artistas AS s
ON s.artistas_id = art.id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;
