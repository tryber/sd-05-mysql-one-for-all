CREATE VIEW top_2_hits_do_momento AS
SELECT 
s.nome AS cancao,
COUNT(r.usuario_id) AS reproducoes
FROM SpotifyClone.reproductions AS r
JOIN SpotifyClone.songs as s
ON r.songs_id = s.id
GROUP BY s.nome
ORDER BY 2 DESC, 1
LIMIT 2;
