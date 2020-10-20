CREATE VIEW historico_reproducao_usuarios AS
SELECT usu.usuario, can.cancao AS nome
FROM SpotifyClone.usuarios AS usu
INNER JOIN SpotifyClone.historico AS his
ON his.id_usuario = usu.id
INNER JOIN SpotifyClone.cancoes AS can
ON can.id = his.id_cancao
ORDER BY 1, 2;

SELECT * FROM historico_reproducao_usuarios;
