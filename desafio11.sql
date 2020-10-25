CREATE VIEW cancoes_premium AS
SELECT ca.cancao AS nome,
COUNT(hi.cancoes_id) AS reproducoes
FROM SpotifyClone.cancoes AS ca
JOIN SpotifyClone.historico_de_reproducoes AS hi
ON(hi.cancoes_id = ca.id)
JOIN SpotifyClone.usuarios as us
ON(us.id = hi.usuarios_id)
JOIN SpotifyClone.planos AS pl
ON(pl.id = us.planos_id)
WHERE pl.plano <> 'gratuito'
GROUP BY `nome`
ORDER BY `nome`;
