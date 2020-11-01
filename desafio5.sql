/* SELECT c.cancao AS cancao, COUNT(*) AS reproducoes 
FROM SpotifyClone.historico_de_reproducoes AS hdr
INNER JOIN SpotifyClone.cancoes AS c
ON c.cancao_id = hdr.cancao_id
GROUP BY c.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
tem custo de 6.05 em relação aos 2.05 da subquery */

CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao AS cancao,
(SELECT COUNT(*)
FROM SpotifyClone.historico_de_reproducoes AS hdr
WHERE c.cancao_id = hdr.cancao_id)
AS reproducoes
FROM SpotifyClone.cancoes AS c
ORDER BY reproducoes DESC, cancao
LIMIT 2;