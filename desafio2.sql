CREATE VIEW estatisticas_musicais AS
SELECT COUNT(*) song,
(SELECT COUNT(*) FROM SpotifyClone.artist) artist,
(SELECT COUNT(*) FROM SpotifyClone.album) album
FROM SpotifyClone.song;
