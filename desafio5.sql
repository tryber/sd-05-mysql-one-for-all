CREATE VIEW `top_2_hits_do_momento` AS
SELECT C.cancao AS cancao, COUNT(R.cancao_id) AS reproducoes
FROM SpotifyClone.cancao AS C
INNER JOIN SpotifyClone.reproducao AS R
ON C.id = R.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
