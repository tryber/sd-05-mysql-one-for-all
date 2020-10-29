CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.name AS `usuario`,
c.name AS `nome`
FROM SpotifyClone.historico_de_reproducoes h
INNER JOIN SpotifyClone.usuario u ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes c ON h.cancoes_id = c.cancoes_id
ORDER BY `usuario`, `nome`;
