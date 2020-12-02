CREATE VIEW faturamento_atual AS
SELECT MIN(c.cost) faturamento_minimo, MAX(c.cost) faturamento_maximo,
ROUND(AVG(c.cost), 2) faturamento_medio,
SUM(cost) faturamento_total
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.plan AS c
ON u.plan_id = c.plan_id;
