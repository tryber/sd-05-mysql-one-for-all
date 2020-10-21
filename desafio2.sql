CREATE VIEW estatisticas_musicais AS
SELECT COUNT(s.song_id) AS cancoes,
(SELECT COUNT(ar.artist_id) FROM SpotifyClone.artists AS ar) AS artistas,
(SELECT COUNT(al.album_id) FROM SpotifyClone.albuns AS al) AS albuns
FROM SpotifyClone.songs AS s;
