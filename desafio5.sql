-- USE SpotifyClone;
-- SELECT * FROM top_2_hits_do_momento;

CREATE VIEW top_2_hits_do_momento AS
SELECT
m.music_name AS 'cancao',
COUNT(mh.user_id) AS 'reproducoes'
FROM SpotifyClone.musics AS m
INNER JOIN SpotifyClone.music_history AS mh ON mh.music_id = m.id
GROUP BY music_id
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
