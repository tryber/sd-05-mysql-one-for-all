CREATE VIEW perfil_artistas AS
SELECT ar.artista AS artista,
al.album AS album,
COUNT(*) AS seguidores
FROM SpotifyClone.artistas AS ar
JOIN SpotifyClone.albuns AS al
ON(al.artistas_id = ar.id)
JOIN SpotifyClone.seguindo_artistas AS se
ON(se.artistas_id = ar.id)
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC,
`artista` ASC, `album` ASC;
