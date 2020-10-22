CREATE VIEW faturamento_atual AS
SELECT MIN(p.preço) AS faturamento_minimo, 
MAX(p.preço) AS faturamento_maximo,
ROUND(AVG(p.preço), 2) AS faturamento_medio,
SUM(p.preço) AS faturamento_total
FROM SpotifyClone.planos AS p 
INNER JOIN SpotifyClone.usuários AS u
ON u.plano = p.id;
