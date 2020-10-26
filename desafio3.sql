CREATE VIEW historico_reproducao_usuarios AS
SELECT U.usuario as usuario, C.cancao AS nome FROM SpotifyClone.usuarios as U
JOIN SpotifyClone.reproducao AS R ON R.usuarios_usuario_id = U.usuario_id
JOIN SpotifyClone.cancoes AS C ON C.id_cancao = R.cancoes_id_cancao
ORDER BY usuario, nome;