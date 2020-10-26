CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT C.id) AS 'cancoes',  COUNT(DISTINCT A.id) AS 'artistas', COUNT(DISTINCT AL.id) AS 'albuns' 
FROM SpotifyClone.cancao C,
SpotifyClone.artista A,
SpotifyClone.album AL;

-- select * from estatisticas_musicais;
