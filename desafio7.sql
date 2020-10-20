DROP VIEW IF EXISTS perfil_artistas;
CREATE VIEW perfil_artistas AS
SELECT art.artista AS artista,
alb.album AS album,
COUNT(seg.id_usuario) AS seguidores
FROM seguidores AS seg
JOIN artistas AS art
ON art.id = seg.id_artista
JOIN albuns AS alb
ON art.id = alb.id_artista
GROUP BY album
ORDER BY 3 DESC, 1, 2;
#SELECT * FROM perfil_artistas;
