CREATE OR REPLACE VIEW SpotifyClone.perfil_artistas AS
SELECT 
art.nome AS artista,
alb.nome AS album,
COUNT(seg.usuario_id) AS seguidores
from SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON alb.artista_id = art.artista_id
INNER JOIN SpotifyClone.seguidos AS seg
ON seg.artista_id = art.artista_id
GROUP BY alb.album_id
ORDER BY 3 DESC, 1, 2;
