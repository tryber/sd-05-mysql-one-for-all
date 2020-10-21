-- Source: https://pt.stackoverflow.com/questions/3455/formatar-casas-decimais-diretamente-no-comando-sql-em-firebird
CREATE VIEW faturamento_atual AS
SELECT
CAST(MIN(P.valor) AS DECIMAL(5,2)) AS faturamento_minimo,
CAST(MAX(P.valor) AS DECIMAL(5,2)) AS faturamento_maximo,
CAST(ROUND(AVG(P.valor), 2) AS DECIMAL(5,2)) faturamento_medio,
CAST(SUM(P.valor) AS DECIMAL(5,2)) AS faturamento_total
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.planos AS P ON U.plano_id = P.plano_id;
