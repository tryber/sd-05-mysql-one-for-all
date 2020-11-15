CREATE VIEW estatisticas_musicais AS
SELECT 
COUNT(DISTINCT c.titulo_cancao) AS 'cancoes',
COUNT(DISTINCT a.nome_artista) AS 'artistas',
COUNT(DISTINCT al.titulo_album) AS 'albuns'
FROM SpotifyClone.cancoes AS c, SpotifyClone.artistas AS a, SpotifyClone.albuns AS al;
