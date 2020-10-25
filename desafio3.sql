CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario AS "usuario", m.musica AS "nome"
FROM SpotifyClone.historico AS h
INNER JOIN SpotifyClone.musica AS m ON h.musica_id = m.musica_id
INNER JOIN SpotifyClone.usuarios AS u ON h.usuario_id = u.usuario_id
ORDER BY `usuario`, `nome`;
