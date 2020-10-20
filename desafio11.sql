DROP VIEW IF EXISTS cancoes_premium;
CREATE VIEW cancoes_premium AS
SELECT can.cancao AS nome,
COUNT(his.id_cancao) AS reproducoes
FROM historico AS his
JOIN cancoes AS can
ON his.id_cancao = can.id
WHERE his.id_usuario IN (2,3)
GROUP BY nome
ORDER BY 1;
#SELECT * FROM cancoes_premium;
