CREATE VIEW estatisticas_musicais AS
SELECT COUNT(id) AS cancoes,
(SELECT COUNT(id) FROM SpotifyClone.artista) AS artistas,
(SELECT COUNT(id) FROM SpotifyClone.album) AS albuns
FROM SpotifyClone.cancao;
