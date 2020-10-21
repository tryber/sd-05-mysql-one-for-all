CREATE VIEW top_3_artistas AS
SELECT a.artist_name AS artista,
COUNT(f.user_id) AS seguidores
FROM SpotifyClone.follower AS f
INNER JOIN SpotifyClone.artists AS a
ON f.artist_id = a.artist_id
GROUP BY f.artist_id
ORDER BY 2 DESC, 1
LIMIT 3;
