CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(id) AS cancoes,
(SELECT COUNT(a.id) FROM SpotifyClone.artist as a) AS artistas,
(SELECT COUNT(al.id) FROM SpotifyClone.album as al) AS albuns
FROM SpotifyClone.songs;
