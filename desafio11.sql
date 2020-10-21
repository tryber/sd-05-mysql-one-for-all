CREATE VIEW cancoes_premium AS
SELECT
s.nome AS nome,
COUNT(r.usuario_id) AS reproducoes
FROM SpotifyClone.reproductions AS r, SpotifyClone.songs AS s, SpotifyClone.usuario AS u
WHERE r.songs_id = s.id AND u.id = r.usuario_id AND (u.plan_id = 2 OR u.plan_id = 3)
GROUP BY nome
ORDER BY 1;
