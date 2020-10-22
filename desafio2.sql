CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT COUNT(M.cancoes) as cancoes,
(select COUNT(*) from SpotifyClone.artistas) AS 'artistas',
(select COUNT(*) from SpotifyClone.albuns) AS 'albuns'
FROM SpotifyClone.musicas M;
