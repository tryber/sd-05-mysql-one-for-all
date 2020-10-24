CREATE VIEW top_2_hits_do_momento AS
SELECT
  songs.song_title AS 'cancao',
  COUNT(song_history.user_id) AS 'reproducoes'
FROM
  SpotifyClone.songs AS songs
JOIN
  SpotifyClone.song_history AS song_history
ON
  song_history.song_id = songs.song_id
GROUP BY
  song_history.song_id
ORDER BY 
  `reproducoes` DESC,
  `cancao`
LIMIT 2;
