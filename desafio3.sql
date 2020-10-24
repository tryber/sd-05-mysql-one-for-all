CREATE VIEW historico_reproducao_usuarios AS
SELECT
  users.username AS 'usuario',
  songs.song_title AS 'nome'
FROM
  SpotifyClone.users AS users
JOIN
  SpotifyClone.song_history AS song_history 
ON
  users.user_id = song_history.user_id
JOIN
  SpotifyClone.songs AS songs 
ON
  song_history.song_id = songs.song_id
ORDER BY
  `usuario`,
  `nome`;
