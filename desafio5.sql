CREATE VIEW top_2_hits_do_momento AS
SELECT can.nome_cancao AS cancao,
COUNT(rep.usuario_id) AS reproducoes
FROM SpotifyClone.hreprodução AS rep
INNER JOIN SpotifyClone.cancoes AS can
ON rep.cancoes_id = can.cancoes_id
GROUP BY rep.cancoes_id
ORDER BY 2 DESC, 1 LIMIT 2;
