CREATE VIEW top_2_hits_do_momento AS
SELECT c.nome AS cancao,
COUNT(hr.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN historico_de_reproducoes AS hr ON c.cancao_id = hr.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
