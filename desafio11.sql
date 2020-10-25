CREATE VIEW cancoes_premium AS 
SELECT song.cancoes as nome, count(hist.usuario_id) as reproducoes
FROM SpotifyClone.Historico as hist
JOIN SpotifyClone.Canções as song
ON song.cancoes_id = hist.cancoes_id
JOIN SpotifyClone.Usuário as usr
ON hist.usuario_id = usr.usuario_id
WHERE usr.plano_id > 1 
GROUP BY song.cancoes_id
ORDER BY song.cancoes
