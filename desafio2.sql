DROP VIEW IF EXISTS estatisticas_musicais;

CREATE VIEW estatisticas_musicais AS
SELECT MAX(C.cancao_id) AS 'cancoes', MAX(AR.artista_id) AS 'artistas', MAX(AL.album_id) AS 'albuns'
FROM SpotifyClone.cancoes AS C, SpotifyClone.artistas AS AR, SpotifyClone.albuns AS AL;
