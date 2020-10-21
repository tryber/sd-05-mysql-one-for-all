CREATE VIEW perfil_artistas AS
SELECT AR.artista 'artista', AL.album AS 'album', COUNT(S.usuario_id) AS 'seguidores'
FROM SpotifyClone.albuns AS AL
INNER JOIN SpotifyClone.artistas AS AR
ON AR.artista_id = AL.artista_id
INNER JOIN SpotifyClone.seguidores AS S
ON AR.artista_id = S.artista_id
GROUP BY AL.album_id
ORDER BY `seguidores` DESC, `artista`, `album`;
