CREATE VIEW `historico_reproducao_usuarios` AS
SELECT U.usuario, C.cancao AS nome
FROM spotifyclone.usuario AS U
INNER JOIN spotifyclone.reproducao AS R
ON R.usuario_id = U.id
INNER JOIN spotifyclone.cancao AS C
ON R.cancao_id = C.id
ORDER BY U.usuario, nome;