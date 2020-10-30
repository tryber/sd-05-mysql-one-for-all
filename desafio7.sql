CREATE VIEW perfil_artistas AS
SELECT a.NOME_ARTISTA AS 'artista', alb.NAME_ALBUM AS 'album', COUNT(sa.USUARIO_ID) AS 'seguidores'
FROM SpotifyClone.seguindo_artista AS sa
INNER JOIN artista AS a
ON a.ARTISTA_ID = sa.ARTISTA_ID
INNER JOIN album AS alb
ON alb.ARTISTA_ID = a.ARTISTA_ID
GROUP BY alb.ALBUM_ID;
