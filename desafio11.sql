CREATE VIEW cancoes_premium AS
SELECT s.song_name AS nome,
COUNT(h.user_id) AS reproducoes
FROM SpotifyClone.historic AS h
INNER JOIN SpotifyClone.songs AS s
ON h.song_id = s.song_id
INNER JOIN SpotifyClone.users as u
ON h.user_id = u.user_id
WHERE u.plan_id IN(2,3)
GROUP BY h.song_id
ORDER BY 1;
