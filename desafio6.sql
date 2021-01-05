CREATE VIEW faturamento_atual AS
SELECT ROUND(MIN(pla.valor_plano),2) AS faturamento_minimo,
ROUND(MAX(pla.valor_plano),2) AS faturamento_maximo,
ROUND(AVG(pla.valor_plano),2) AS faturamento_medio,
ROUND(SUM(pla.valor_plano),2) AS faturamento_total
FROM SpotifyClone.planos AS pla
INNER JOIN SpotifyClone.usuarios AS usr
ON usr.plano_id = pla.plano_id;
