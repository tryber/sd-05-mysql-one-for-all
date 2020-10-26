CREATE VIEW faturamento_atual AS
SELECT MIN(P.valor_plano) AS 'faturamento_minimo', MAX(P.valor_plano) AS 'faturamento_maximo', ROUND(AVG(P.valor_plano), 2) AS 'faturamento_medio', ROUND(SUM(P.valor_plano), 2) AS 'faturamento_total'
FROM SpotifyClone.plano AS P
INNER JOIN SpotifyClone.usuario AS U
ON P.id = U.plano_id;

-- select * from faturamento_atual;
-- DROP VIEW faturamento_atual;
