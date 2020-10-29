CREATE VIEW top_2_hits_do_momento AS
SELECT
c.name as 'cancao',
(SELECT COUNT(*) FROM SpotifyClone.historico_de_reproducoes AS h WHERE c.cancoes_id = h.cancoes_id) AS 'reproducoes'
from SpotifyClone.cancoes as c
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` LIMIT 2;
