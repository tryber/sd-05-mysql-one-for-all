CREATE VIEW historico_reproducao_usuarios AS
SELECT usu.nome_usuario AS usuario,
can.nome_cancao AS nome
FROM SpotifyClone.hreprodução AS rep
INNER JOIN SpotifyClone.usuario AS usu
ON rep.usuario_id = usu.usuario_id
INNER JOIN SpotifyClone.cancoes AS can
ON rep.cancoes_id = can.cancoes_id
ORDER BY 1, 2;
