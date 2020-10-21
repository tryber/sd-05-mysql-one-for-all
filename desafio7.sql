CREATE VIEW perfil_artistas AS
SELECT a.artista AS "artista", al.album AS "album", COUNT(s.usuario_id) AS "seguidores"
FROM SpotifyClone.album as al
INNER JOIN SpotifyClone.seguindo as s ON al.artista_id = s.artista_id
INNER JOIN SpotifyClone.artistas as a ON a.artista_id = al.artista_id
GROUP BY `album`
ORDER BY `seguidores`DESC, `artista`, `album`;
