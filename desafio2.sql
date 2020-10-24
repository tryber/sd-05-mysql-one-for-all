CREATE VIEW estatisticas_musicais AS
SELECT
  COUNT(DISTINCT songs.song_title) AS 'cancoes',
  COUNT(DISTINCT artists.artist_name) AS 'artistas',
  COUNT(DISTINCT albums.album_title) AS 'albuns'
FROM
  SpotifyClone.songs AS songs,
  SpotifyClone.artists AS artists,
  SpotifyClone.albums AS albums;
