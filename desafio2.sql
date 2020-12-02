CREATE VIEW estatisticas_musicais AS
SELECT COUNT(*) cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artist) artistas,
(SELECT COUNT(*) FROM SpotifyClone.album) albuns
FROM SpotifyClone.song;
