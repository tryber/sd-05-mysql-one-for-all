CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT (
SELECT COUNT(can.cancao_id) AS cancoes
FROM SpotifyClone.cancao AS can
) AS cancoes,
(
SELECT COUNT(art.artista_id) AS artistas
FROM SpotifyClone.artista AS art
) AS artistas,
(
SELECT COUNT(alb.album_id) AS albuns
FROM SpotifyClone.album AS alb
) AS albuns;
