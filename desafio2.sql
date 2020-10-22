CREATE VIEW estatisticas_musicais AS
SELECT COUNT(*) cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artistas) artistas,
(SELECT COUNT(*) FROM SpotifyClone.albuns) albuns
FROM SpotifyClone.cancoes;
