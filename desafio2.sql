-- use SpotifyClone;

CREATE VIEW estatisticas_musicais AS
SELECT 
COUNT(c.titulo_cancao) AS 'cancoes',
COUNT(a.nome_artista) AS 'artistas',
COUNT(al.titulo_album) AS 'albuns'
FROM SpotifyClone.cancoes AS c, SpotifyClone.artistas AS a, SpotifyClone.albuns AS al;
