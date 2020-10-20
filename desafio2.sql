USE SpotifyClone;

CREATE VIEW estatisticas_musicais  AS 
SELECT (SELECT COUNT(song_name) FROM songs) AS cancoes,
(SELECT COUNT(artist_id)  FROM artists) AS artistas,
(SELECT COUNT(album_id)  FROM albums) AS albuns;
