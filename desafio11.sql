CREATE VIEW cancoes_premium AS
SELECT c.cancao_nome nome,
COUNT(r.cancao_id) reproducoes
FROM SpotifyClone.reproducao AS r
INNER JOIN SpotifyClone.cancoes AS c
ON r.cancao_id = c.cancao_id
INNER JOIN SpotifyClone.usuarios AS u
ON r.usuario_id = u.usuario_id
WHERE u.plano_id IN (2,3)
GROUP BY r.cancao_id
ORDER BY nome;
