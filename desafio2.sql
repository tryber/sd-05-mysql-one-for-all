CREATE VIEW estatisticas_musicais AS
SELECT COUNT(c.cancao_id) AS cancoes,
(SELECT COUNT(ar.artista_id) AS artistas FROM artistas AS ar) AS artistas,
(SELECT COUNT(al.album_id) AS artistas FROM albuns AS al) AS albuns
FROM cancoes AS c;
