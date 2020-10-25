CREATE OR REPLACE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT can.nome AS cancao, COUNT(rep.cancao_id) AS reproducoes
FROM SpotifyClone.cancao AS can
INNER JOIN SpotifyClone.reproducao AS rep
ON can.cancao_id = rep.cancao_id
GROUP BY 1	
ORDER BY 2 DESC, 1 ASC
LIMIT 2;
