CREATE VIEW historico_reproducao_usuarios AS
SELECT
usuarios.usuario AS usuario,
cancoes.cancao AS nome
FROM SpotifyClone.usuarios_cancoes
LEFT JOIN SpotifyClone.usuarios ON SpotifyClone.usuarios_cancoes.usuario_id = SpotifyClone.usuarios.id
LEFT JOIN SpotifyClone.cancoes ON SpotifyClone.usuarios_cancoes.cancao_id = SpotifyClone.cancoes.id
ORDER BY usuario, nome;
