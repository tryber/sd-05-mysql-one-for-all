CREATE VIEW top_2_hits_do_momento AS
SELECT ca.cancao AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.cancoes AS ca
JOIN SpotifyClone.historico_de_reproducoes AS hi
ON(ca.id = hi.cancoes_id)
GROUP BY ca.cancao, hi.cancoes_id
ORDER BY `reproducoes` DESC, ca.cancao ASC LIMIT 2;
