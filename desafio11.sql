SELECT c.título AS nome,
COUNT(r.usuário) AS reproducoes
FROM SpotifyClone.canções AS c
INNER JOIN SpotifyClone.reproduções AS r
ON c.id = r.canção
INNER JOIN SpotifyClone.usuários AS u
ON u.id = r.usuário
WHERE u.plano IN (2, 3)
GROUP BY r.canção
order by c.título;
