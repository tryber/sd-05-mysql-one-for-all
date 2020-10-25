CREATE OR REPLACE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT usr.nome AS usuario, can.nome AS nome
FROM SpotifyClone.usuario AS usr
INNER JOIN SpotifyClone.reproducao AS rep
ON usr.usuario_id = rep.usuario_id
LEFT JOIN SpotifyClone.cancao AS can
ON can.cancao_id = rep.cancao_id
ORDER BY 1, 2;
