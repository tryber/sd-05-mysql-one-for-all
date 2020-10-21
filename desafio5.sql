CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT can.cancao_nome AS cancao, COUNT(his.usuario_id) AS reproducoes
FROM SpotifyClone.cancao AS can
INNER JOIN SpotifyClone.historico_reproducao AS his ON (can.cancao_id = his.cancao_id)
GROUP BY can.cancao_id
ORDER BY 2 DESC, 1
LIMIT 2;