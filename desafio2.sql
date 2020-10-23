CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT c.cancao) AS cancoes,
COUNT(DISTINCT ar.artista) AS artistas,
COUNT(DISTINCT al.album) AS albuns
FROM
SpotifyClone.cancoes c,
SpotifyClone.artistas ar,
SpotifyClone.albuns al;
