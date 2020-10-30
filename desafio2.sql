CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT c.name) AS cancoes,
COUNT(DISTINCT at.name) AS artistas,
COUNT(DISTINCT ab.name) AS albuns
FROM SpotifyClone.album as ab, SpotifyClone.artista as at, SpotifyClone.cancoes as c;
