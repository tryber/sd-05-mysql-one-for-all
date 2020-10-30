CREATE VIEW faturamento_atual AS
SELECT MIN(p.VALOR_PLANO) AS 'faturamento_minimo',
MAX(p.VALOR_PLANO) AS 'faturamento_maximo',
ROUND(AVG(p.VALOR_PLANO), 2) AS 'faturamento_medio',
SUM(p.VALOR_PLANO) AS 'faturamento_total'
FROM SpotifyClone.usuario AS u
INNER JOIN plano AS p
ON p.PLANO_ID = u.PLANO_ID;
