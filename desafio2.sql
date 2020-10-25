CREATE OR REPLACE VIEW SpotifyClone.estatisticas_musicais AS
SELECT (
SELECT COUNT(can.cancao_id) AS cancao
FROM SpotifyClone.cancao AS can
) AS cancoes,
(
SELECT COUNT(art.artista_id) AS artista
FROM SpotifyClone.artista AS art
) AS artistas,
(
SELECT COUNT(alb.album_id) AS album
FROM SpotifyClone.album AS alb
) AS albuns;
