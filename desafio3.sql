CREATE VIEW historico_reproducao_usuarios AS
SELECT
U.name AS `usuario`,
C.name AS `nome`
FROM SpotifyClone.historico_de_reproducoes HR
INNER JOIN SpotifyClone.usuario U ON HR.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.cancoes C ON HR.cancoes_id = C.cancoes_id
ORDER BY `usuario`, `nome`;
