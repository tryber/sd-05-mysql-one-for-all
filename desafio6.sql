CREATE VIEW faturamento_atual AS
SELECT MIN(pl.valor_plano) AS faturamento_minimo,
MAX(pl.valor_plano) AS faturamento_maximo,
ROUND(AVG(pl.valor_plano), 2) AS faturamento_medio,
SUM(pl.valor_plano) AS faturamento_total
FROM SpotifyClone.planos AS pl
JOIN SpotifyClone.usuarios AS u
ON(u.planos_id = pl.id);

-- ta errado!!!!!!!!!!!!!!!!!!