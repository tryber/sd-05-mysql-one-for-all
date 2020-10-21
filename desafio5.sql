CREATE VIEW top_2_hits_do_momento AS
SELECT s.song_name AS cancao,
COUNT(h.user_id) AS reproducoes
FROM SpotifyClone.historic AS h
INNER JOIN SpotifyClone.songs AS s
ON h.song_id = s.song_id
GROUP BY h.song_id
ORDER BY 2 DESC, 1
LIMIT 2;
