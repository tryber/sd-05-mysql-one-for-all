CREATE VIEW top_3_artistas AS
SELECT
  artists.artist_name AS 'artista',
  COUNT(DISTINCT following.user_id) AS 'seguidores'
FROM
  SpotifyClone.artists AS artists
JOIN
  SpotifyClone.following AS following
ON
  following.artist_id = artists.artist_id
GROUP BY
  following.artist_id
ORDER BY
  `seguidores` DESC,
  `artista`
LIMIT 3;
