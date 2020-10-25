CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario AS usuario,
c.cancao AS nome
FROM SpotifyClone.usuarios AS u
JOIN SpotifyClone.historico_de_reproducoes h
ON(h.usuarios_id = u.id)
JOIN SpotifyClone.cancoes AS c
ON(h.cancoes_id = c.id)
ORDER BY u.usuario, c.cancao;
