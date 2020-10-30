USE SpotifyClone;
CREATE VIEW estatisticas_musicais AS
	SELECT COUNT(DISTINCT c.CANCOES_ID) AS 'cancoes',
	COUNT(DISTINCT a.ARTISTA_ID) AS 'artistas',
	COUNT(DISTINCT al.ALBUM_ID) AS 'albuns'
	FROM cancoes AS c, artista AS a, album AS al;
