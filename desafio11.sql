-- USE SpotifyClone;
-- DROP VIEW cancoes_premium;
-- SELECT * FROM cancoes_premium;

CREATE VIEW cancoes_premium AS
SELECT m.music_name AS 'nome',
COUNT(mh.music_id) AS 'reproducoes'
FROM SpotifyClone.musics AS m
JOIN SpotifyClone.music_history AS mh ON mh.music_id = m.id
JOIN SpotifyClone.users AS u ON u.id = mh.user_id
WHERE u.plan_id IN(2,3)
GROUP BY music_id
ORDER BY `nome`;
