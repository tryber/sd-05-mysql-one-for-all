CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome_usuario AS usuario,
c.cancao_nome AS nome
FROM SpotifyClone.reproducao AS r
INNER JOIN SpotifyClone.usuarios AS u
ON r.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes AS c
ON r.cancao_id = c.cancao_id
ORDER BY 1, 2;
