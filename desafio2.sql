CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(cancoes.id) AS cancoes,
(SELECT COUNT(id) FROM SpotifyClone.artistas) AS artistas,
(SELECT COUNT(id) FROM SpotifyClone.albuns) AS albuns
FROM
SpotifyClone.cancoes;
