CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao_nome cancao,
COUNT(r.cancao_id) reproducoes
FROM SpotifyClone.reproducao AS r
INNER JOIN SpotifyClone.cancoes AS c
ON r.cancao_id = c.cancao_id
GROUP BY r.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
