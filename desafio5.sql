CREATE VIEW top_2_hits_do_momento AS
SELECT C.cancao as cancao, COUNT(R.usuarios_usuario_id) AS reproducoes FROM SpotifyClone.cancoes AS C
JOIN SpotifyClone.reproducao AS R ON R.cancoes_id_cancao = C.id_cancao
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
