CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome_usuario usuario,
c.cancao_nome nome
FROM SpotifyClone.reproducao r
INNER JOIN SpotifyClone.usuarios u
ON u.usuario_id = r.usuario_id
INNER JOIN SpotifyClone.cancoes c
ON c.cancao_id = r.cancao_id
ORDER BY usuario, nome;
