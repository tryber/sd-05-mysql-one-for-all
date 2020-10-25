CREATE VIEW historico_reproducao_usuarios AS
SELECT U.nome_usuario AS usuario, C.nome_cancao AS nome
FROM SpotifyClone.usuario U
INNER JOIN SpotifyClone.historico_de_reproducoes HR
ON U.id = HR.usuario_id
INNER JOIN SpotifyClone.cancao C 
ON HR.cancao_id = C.id
ORDER BY U.nome_usuario ASC, C.nome_cancao ASC;

-- select * from historico_reproducao_usuarios;
