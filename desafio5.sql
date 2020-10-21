DROP VIEW IF EXISTS top_2_hits_do_momento;
CREATE VIEW top_2_hits_do_momento AS
SELECT can.cancao AS cancao, COUNT(his.id_usuario) AS reproducoes
FROM historico AS his
JOIN cancoes AS can
ON can.id = his.id_cancao
GROUP BY can.id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
#SELECT * FROM top_2_hits_do_momento;
