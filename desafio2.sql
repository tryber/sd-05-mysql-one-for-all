CREATE VIEW estatisticas_musicais AS
SELECT COUNT(nome_cancao) AS cancoes,
(SELECT COUNT(artista_id) FROM SpotifyClone.artistas) AS artistas,
(SELECT COUNT(albuns_id) FROM SpotifyClone.albuns) AS albuns
FROM cancoes;