CREATE VIEW cancoes_premium AS
SELECT c.nome AS nome,
COUNT(hr.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN historico_de_reproducoes AS hr ON c.cancao_id = hr.cancao_id
INNER JOIN usuarios AS u ON u.usuario_id = hr.usuario_id
WHERE u.plano_id IN(2, 3)
GROUP BY nome
ORDER BY nome;
