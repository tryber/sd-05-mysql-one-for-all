CREATE VIEW faturamento_atual AS
SELECT ROUND(MIN(P.valor), 2) AS faturamento_minimo,
ROUND(AVG(P.valor), 2) AS faturamento_medio,
ROUND(MAX(P.valor), 2) AS faturamento_maximo,
ROUND(SUM(P.valor), 2) AS faturamento_total
FROM SpotifyClone.plano as P
INNER JOIN SpotifyClone.usuario as U
ON U.plano_id = P.id
