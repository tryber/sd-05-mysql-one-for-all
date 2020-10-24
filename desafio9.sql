-- https://www.w3resource.com/mysql/mysql-procedure.php
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(50))

BEGIN
  SELECT
    artists.artist_name AS 'artista',
    albums.album_title AS 'album'
  FROM
    SpotifyClone.artists AS artists
  JOIN
    SpotifyClone.albums AS albums
  ON
    albums.artist_id = artists.artist_id
  WHERE
    artists.artist_name = artista
  ORDER BY
    `album`;
END
$$ DELIMITER ;
