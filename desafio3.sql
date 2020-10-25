CREATE VIEW `historico_reproducao_usuarios` AS
SELECT U.usuario AS usuario, C.cancao AS nome
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.reproducao AS R
ON R.usuario_id = U.id
INNER JOIN SpotifyClone.cancao AS C
ON R.cancao_id = C.id
ORDER BY usuario, nome;
