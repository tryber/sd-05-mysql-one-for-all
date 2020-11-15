CREATE VIEW perfil_artistas AS
SELECT
art.nome_artista AS 'artista',
alb.titulo_album AS 'album',
COUNT(sa.usuario_id) AS 'seguidores'
FROM SpotifyClone.seguindo_artista AS sa
INNER JOIN SpotifyClone.artistas AS art ON art.artista_id = sa.artista_id
INNER JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id
GROUP BY alb.album_id
ORDER BY `seguidores` DESC, `artista`, `album`;
