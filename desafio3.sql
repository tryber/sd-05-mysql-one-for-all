CREATE VIEW historico_reproducao_usuarios AS
SELECT 
U.usuario_nome usuario,
M.musica_nome nome
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico_de_reproducoes AS H ON H.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.musicas AS M ON M.musica_id = H.musica_id
ORDER BY usuario, nome;
