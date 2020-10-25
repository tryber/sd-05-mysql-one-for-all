CREATE VIEW top_2_hits_do_momento AS
SELECT m.musica AS "cancao" , COUNT(h.usuario_id) AS "reproducoes"
FROM SpotifyClone.historico as h
INNER JOIN SpotifyClone.musica as m on m.musica_id = h.musica_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
