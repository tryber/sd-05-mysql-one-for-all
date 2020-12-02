CREATE VIEW perfil_artistas AS
SELECT n.artist_name artista,
a.album_name album,
COUNT(s.artist_id) seguidores
FROM SpotifyClone.follow_artist AS s
INNER JOIN SpotifyClone.artist AS n
ON s.artist_id = n.artist_id
INNER JOIN SpotifyClone.album AS a
ON a.artist_id = n.artist_id
GROUP BY a.album_id
ORDER BY seguidores DESC, artista, album;
