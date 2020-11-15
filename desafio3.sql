CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.usuario AS usuario
c.cancao AS nome
FROM
SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_reproducoes hr
ON hr.usuarios_id = u.id
INNER JOIN SpotifyClone.cancoes AS c
ON hr.cancoes_id = c.id
ORDER BY u.usuario, c.cancao;
