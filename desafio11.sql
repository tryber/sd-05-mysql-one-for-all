CREATE VIEW cancoes_premium AS
SELECT C.cancao AS 'nome', COUNT(H.cancao_id) AS 'reproducoes'
FROM SpotifyClone.cancoes AS C, SpotifyClone.historico AS H, SpotifyClone.usuarios AS U
WHERE C.cancao_id = H.cancao_id AND H.usuario_id = U.usuario_id AND U.plano_id IN (2,3)
GROUP BY C.cancao
ORDER BY C.cancao;
