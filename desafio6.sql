CREATE VIEW faturamento_atual AS
SELECT MIN(pla.valor) AS faturamento_minimo,
MAX(pla.valor) AS faturamento_maximo,
ROUND(AVG(pla.valor), 2) AS faturamento_medio,
SUM(valor) AS faturamento_total
FROM SpotifyClone.planos AS pla
INNER JOIN SpotifyClone.usuario AS usu
ON usu.plano_id = pla.plano_id;
