-- USE SpotifyClone;
-- SELECT * FROM faturamento_atual;

CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(plan_price), 2) AS 'faturamento_minimo',
ROUND(MAX(plan_price),2) AS 'faturamento_maximo',
ROUND(AVG(plan_price), 2) AS 'faturamento_medio',
ROUND(SUM(plan_price), 2) AS 'faturamento_total'
FROM SpotifyClone.plans
INNER JOIN SpotifyClone.users ON users.plan_id = plans.id;
