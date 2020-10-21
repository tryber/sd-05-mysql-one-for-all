-- USE SpotifyClone;
-- SELECT * FROM perfil_artistas;

CREATE VIEW perfil_artistas AS
SELECT
a.artist_name AS 'artista',
alb.album_name AS 'album',
COUNT(f.user_id) AS 'seguidores'
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS alb ON alb.artist_id = a.id
INNER JOIN SpotifyClone.followers AS f ON f.artist_id = a.id
GROUP BY alb.id
ORDER BY `seguidores` DESC, `artista`, `album`;
