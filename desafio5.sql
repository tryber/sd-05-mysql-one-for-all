CREATE VIEW top_2_hits_do_momento AS
SELECT
cancoes.cancao AS cancao,
COUNT(usuarios_cancoes.usuario_id) AS reproducoes
FROM SpotifyClone.usuarios_cancoes
LEFT JOIN SpotifyClone.cancoes ON SpotifyClone.usuarios_cancoes.cancao_id = SpotifyClone.cancoes.id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
