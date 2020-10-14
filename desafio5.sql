CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao_nome AS cancao,
COUNT(r.usuario_id) AS reproducoes
FROM SpotifyClone.reproducao AS r
INNER JOIN SpotifyClone.cancoes AS c
ON r.cancao_id = c.cancao_id
GROUP BY r.cancao_id
ORDER BY 2 DESC, 1
LIMIT 2;
