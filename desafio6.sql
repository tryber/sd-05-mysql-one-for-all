CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT FORMAT(MIN(pln.plano_valor), 2) AS faturamento_minimo,
    FORMAT(MAX(pln.plano_valor), 2) AS faturamento_maximo,
    FORMAT(
        ROUND(SUM(pln.plano_valor) / COUNT(usr.plano_id), 2),
        2
    ) AS faturamento_medio,
    FORMAT(ROUND(SUM(pln.plano_valor), 2), 2) AS faturamento_total
FROM SpotifyClone.plano AS pln
    INNER JOIN SpotifyClone.usuario AS usr ON (pln.plano_id = usr.plano_id);
