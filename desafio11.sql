CREATE VIEW cancoes_premium AS
SELECT
cancoes.cancao AS nome,
COUNT(usuarios_cancoes.usuario_id) AS reproducoes
FROM SpotifyClone.usuarios_cancoes
LEFT JOIN SpotifyClone.cancoes ON SpotifyClone.cancoes.id = SpotifyClone.usuarios_cancoes.cancao_id
LEFT JOIN SpotifyClone.usuarios ON SpotifyClone.usuarios.id = SpotifyClone.usuarios_cancoes.usuario_id
LEFT JOIN SpotifyClone.planos ON SpotifyClone.planos.id = SpotifyClone.usuarios.plano_id
WHERE planos.plano IN ('familiar', 'universitario')
GROUP BY nome
ORDER BY nome;
