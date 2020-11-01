CREATE VIEW cancoes_premium AS
SELECT c.cancao AS nome,
COUNT(hdr.usuario_id) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes AS hdr
INNER JOIN SpotifyClone.cancoes AS c
ON hdr.cancao_id = c.cancao_id
INNER JOIN SpotifyClone.usuarios AS usr
ON hdr.usuario_id = usr.usuario_id
WHERE usr.plano_id IN(2,3)
GROUP BY hdr.cancao_id
ORDER BY nome;
