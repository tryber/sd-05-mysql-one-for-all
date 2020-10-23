CREATE VIEW top_2_hits_do_momento AS
SELECT
c.name AS `cancao`,
COUNT(*) AS `reproducoes`
FROM SpotifyClone.historico_de_reproducoes h, SpotifyClone.cancoes c
WHERE h.cancoes_id = c.cancoes_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` LIMIT 2;
