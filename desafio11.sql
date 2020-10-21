CREATE VIEW cancoes_premium AS
SELECT can.nome_cancao AS nome,
COUNT(rep.usuario_id) AS reproducoes
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.hreprodução AS rep
ON can.cancoes_id = rep.cancoes_id
INNER JOIN SpotifyClone.usuario AS usu
ON rep.usuario_id = usu.usuario_id
WHERE usu.plano_id IN (2, 3)
GROUP BY rep.cancoes_id
ORDER BY 1;
