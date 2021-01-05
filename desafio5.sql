CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao AS cancao,
(SELECT COUNT(*)
FROM SpotifyClone.historico_de_reproducoes AS hist
WHERE c.cancao_id = hist.cancao_id)
AS reproducoes
FROM SpotifyClone.cancoes AS c
ORDER BY reproducoes DESC, cancao
LIMIT 2;
