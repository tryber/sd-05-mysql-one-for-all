CREATE VIEW faturamento_atual AS
SELECT ROUND(MIN(p.preço), 2) AS faturamento_minimo, 
ROUND(MAX(p.preço), 2) AS faturamento_maximo,
ROUND(SUM(p.preço) / COUNT(*), 2) AS faturamento_medio,
ROUND(SUM(p.preço), 2) AS faturamento_total
FROM SpotifyClone.planos AS p 
INNER JOIN SpotifyClone.usuários AS u
ON u.plano = p.id; 
