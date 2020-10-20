CREATE VIEW faturamento_atual AS
SELECT MIN(valor_plano) AS 'faturamento_minimo',
(SELECT MAX(valor_plano) FROM planos) AS 'faturamento_maximo',
(SELECT ROUND((AVG(pla.valor_plano)),2) FROM planos AS pla
INNER JOIN usuarios AS usu
ON usu.id_plano = pla.id) AS 'faturamento_medio',
(SELECT SUM(pla.valor_plano) FROM planos AS pla
INNER JOIN usuarios AS usu
ON usu.id_plano = pla.id) AS 'faturamento_total'
FROM planos;

SELECT * FROM faturamento_atual;
