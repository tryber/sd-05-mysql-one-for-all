CREATE VIEW historico_reproducao_usuarios AS
SELECT U.usuario AS 'usuario', C.cancao AS 'nome'
FROM SpotifyClone.usuarios AS U, SpotifyClone.cancoes AS C, SpotifyClone.historico AS H
WHERE U.usuario_id = H.usuario_id AND C.cancao_id = H.cancao_id
ORDER BY `usuario`, `nome`;
