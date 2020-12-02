CREATE VIEW cancoes_premium AS
SELECT s.song_name nome,
COUNT(r.song_id) reproducoes
FROM SpotifyClone.reproduction AS r
INNER JOIN SpotifyClone.song AS s
ON r.song_id = s.song_id
INNER JOIN SpotifyClone.user AS u
ON r.user_id = u.user_id
WHERE u.plan_id IN (2,3)
GROUP BY r.song_id
ORDER BY nome;
