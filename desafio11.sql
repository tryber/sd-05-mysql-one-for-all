CREATE VIEW cancoes_premium AS
SELECT c.name as `nome`,
COUNT(*) AS 'reproducoes'
FROM SpotifyClone.historico_de_reproducoes h, SpotifyClone.cancoes c, SpotifyClone.usuario u
WHERE h.cancoes_id = c.cancoes_id AND u.usuario_id = h.usuario_id AND u.plan_id IN (2, 3)
GROUP BY `nome`
ORDER BY `nome`;
