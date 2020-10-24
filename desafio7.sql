CREATE VIEW perfil_artistas AS
SELECT
  artists.artist_name AS 'artista',
  albums.album_title AS 'album',
  COUNT(following.user_id) AS 'seguidores'
FROM
  SpotifyClone.artists AS artists
JOIN
  SpotifyClone.albums AS albums
ON
  albums.artist_id = artists.artist_id
JOIN
  SpotifyClone.following AS following
ON
  following.artist_id = artists.artist_id
GROUP BY
  albums.album_id
ORDER BY
  `seguidores` DESC,
  `artista`,
  `album`;
