USE spotifyclone;

CREATE VIEW `estatisticas_musicais` AS
SELECT COUNT(id) AS cancoes,
(SELECT COUNT(id) FROM artista) AS artistas,
(SELECT COUNT(id) FROM album) AS albuns
FROM cancao;
