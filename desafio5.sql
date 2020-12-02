CREATE VIEW top_2_hits_do_momento AS
SELECT s.song_name cancao,
COUNT(r.song_id) reproducoes
FROM SpotifyClone.reproduction AS r
INNER JOIN SpotifyClone.song AS s
ON r.song_id = s.song_id
GROUP BY r.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
