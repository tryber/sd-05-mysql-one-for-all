CREATE VIEW top_2_hits_do_momento AS
SELECT
c.name as 'cancao',
COUNT(*) as 'reproducoes'
FROM SpotifyClone.cancoes as c
JOIN SpotifyClone.historico_de_reproducoes AS h
ON c.cancoes_id = h.cancoes_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` LIMIT 2;
