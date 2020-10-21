CREATE VIEW perfil_artistas AS
SELECT ar.artist_name AS artista,
al.album_name AS album,
COUNT(f.user_id) AS seguidores
FROM SpotifyClone.follower AS f
INNER JOIN SpotifyClone.artists AS ar
ON f.artist_id = ar.artist_id
INNER JOIN SpotifyClone.albuns AS al
ON f.artist_id = al.artist_id
GROUP BY al.album_id
ORDER BY 3 DESC, 1, 2;
