CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome AS usuario, 
c.título AS nome
FROM SpotifyClone.usuários AS u
INNER JOIN SpotifyClone.canções AS c
INNER JOIN SpotifyClone.reproduções AS r
ON r.canção = c.id AND u.id = r.usuário
ORDER BY u.nome, c.título; 
