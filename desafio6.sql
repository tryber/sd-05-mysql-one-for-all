CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(planos.valor_plano), 2) AS faturamento_minimo,
ROUND(MAX(planos.valor_plano), 2) AS faturamento_maximo,
ROUND(AVG(planos.valor_plano), 2) AS faturamento_medio,
ROUND(SUM(planos.valor_plano), 2) AS faturamento_total
FROM SpotifyClone.usuarios
JOIN SpotifyClone.planos ON SpotifyClone.planos.id = SpotifyClone.usuarios.plano_id;
