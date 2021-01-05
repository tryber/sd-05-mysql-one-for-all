CREATE VIEW historico_reproducao_usuarios AS
SELECT usr.usuario AS usuario, c.cancao AS nome
FROM SpotifyClone.usuarios AS user
INNER JOIN SpotifyClone.cancoes AS cancoes
INNER JOIN SpotifyClone.historico_de_reproducoes AS historioco
ON historico.cancao_id = cancoes.cancao_id AND historico.usuario_id = user.usuario_id
ORDER BY usuario, nome;
