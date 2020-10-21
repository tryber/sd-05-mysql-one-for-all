CREATE VIEW estatisticas_musicais AS
SELECT COUNT(id) AS cancoes,
(SELECT COUNT(id) FROM spotifyclone.artista) AS artistas,
(SELECT COUNT(id) FROM spotifyclone.album) AS albuns
FROM spotifyclone.cancao;
