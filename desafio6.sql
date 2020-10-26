CREATE VIEW faturamento_atual AS
SELECT MIN(P.valor_plano) AS faturamento_minimo,
MAX(P.valor_plano) as faturamento_maximo,
ROUND(AVG(P.valor_plano),2) AS faturamento_medio,
SUM(valor_plano) AS faturamento_total
FROM SpotifyClone.planos AS P
JOIN SpotifyClone.usuarios as U ON P.id_plano = U.planos_id_plano;
