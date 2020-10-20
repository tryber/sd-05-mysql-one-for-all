DROP VIEW IF EXISTS top_2_hits_do_momento;
CREATE VIEW top_2_hits_do_momento AS
SELECT can.cancao AS cancao, COUNT(his.id_usuario) AS reproducoes FROM SpotifyClone.historico AS his
JOIN SpotifyClone.cancoes AS can
ON can.id = his.id_cancao
GROUP BY can.id
ORDER BY reproducoes DESC, cancao
LIMIT 2;

SELECT * FROM top_2_hits_do_momento;
