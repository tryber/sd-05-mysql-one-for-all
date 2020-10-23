CREATE VIEW historico_reproducao_usuarios AS
SELECT U.nome_usuario AS usuario, M.cancoes AS nome
FROM SpotifyClone.usuarios U
INNER JOIN SpotifyClone.historico_de_reproducoes H
ON U.id = H.usuario_id
INNER JOIN SpotifyClone.musicas M
ON M.id = H.cancao_id
ORDER BY 1, 2;
