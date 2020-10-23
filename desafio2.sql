CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT c.name) AS 'cancoes',
COUNT(DISTINCT ar.name) AS 'artistas',
COUNT(DISTINCT al.name) AS 'albuns'
FROM SpotifyClone.album as al, SpotifyClone.artista as ar, SpotifyClone.cancoes as c;
