DROP VIEW IF EXISTS estatisticas_musicais;
CREATE VIEW estatisticas_musicais AS 
SELECT COUNT(cancao) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artistas) AS artistas,
(SELECT COUNT(*) FROM SpotifyClone.albuns) AS albuns
FROM SpotifyClone.cancoes;

SELECT * FROM estatisticas_musicais;

Error Code: 1146. Table 'SpotifyClone.estatisticas_musicais' doesn't exist

