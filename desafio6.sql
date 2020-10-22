-- Referência: query desenvolvida com a ajuda de Sidnei Ramos e Zambelli
CREATE VIEW faturamento_atual AS
SELECT CONVERT(MIN(p.preço), CHAR) AS faturamento_minimo, 
CONVERT(MAX(p.preço), CHAR) AS faturamento_maximo,
CONVERT(ROUND(AVG(p.preço), 2), CHAR) AS faturamento_medio,
CONVERT(SUM(p.preço), CHAR) AS faturamento_total
FROM SpotifyClone.planos AS p 
INNER JOIN SpotifyClone.usuários AS u
ON u.plano = p.id;
