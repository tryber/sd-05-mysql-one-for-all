CREATE VIEW historico_reproducao_usuarios AS
SELECT 
U.usuario_nome usuario,
M.musica_nome nome
FROM spotifyclone.usuarios AS U
INNER JOIN spotifyclone.historico_de_reproducoes AS H ON H.usuario_id = U.usuario_id
INNER JOIN spotifyclone.musicas AS M ON M.musica_id = H.musica_id
ORDER BY usuario, nome;
