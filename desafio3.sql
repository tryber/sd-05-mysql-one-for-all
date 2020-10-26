CREATE VIEW historico_reproducao_usuarios AS
SELECT U.nome_usuario AS usuario, C.nome_cancao AS nome
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.historico_de_reproducoes AS HR
ON U.id = HR.usuario_id
INNER JOIN SpotifyClone.cancao AS C
ON HR.cancao_id = C.id
ORDER BY U.nome_usuario ASC, C.nome_cancao ASC;
