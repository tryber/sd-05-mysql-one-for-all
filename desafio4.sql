CREATE VIEW top_3_artistas AS
SELECT n.artist_name artista,
COUNT(u.user_id) seguidores
FROM SpotifyClone.follow_artist AS u
INNER JOIN SpotifyClone.artist AS n
ON u.artist_id = n.artist_id
GROUP BY n.artist_id
ORDER BY seguidores DESC, artista
LIMIT 3;
