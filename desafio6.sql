CREATE VIEW faturamento_atual AS
SELECT MIN(p.valor) faturamento_minimo,
MAX(p.valor) faturamento_maximo,
ROUND(AVG(p.valor), 2) faturamento_medio,
SUM(valor) faturamento_total
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.planos AS p
ON u.plano_id = p.plano_id;
