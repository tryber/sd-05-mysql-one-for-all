CREATE VIEW faturamento_atual AS
SELECT
MIN(P.valor) AS faturamento_minimo,
MAX(P.valor) AS faturamento_maximo,
CAST(ROUND(AVG(P.valor), 2) AS DECIMAL(5,2)) faturamento_medio,
SUM(P.valor) AS faturamento_total
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.planos AS P ON U.plano_id = P.plano_id;
