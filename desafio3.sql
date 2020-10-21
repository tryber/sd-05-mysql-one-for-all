CREATE VIEW historico_reproducao_usuarios AS
SELECT 
u.nome AS usuario,
s.nome AS nome
FROM SpotifyClone.reproductions AS r
JOIN SpotifyClone.usuario as u
ON r.usuario_id = u.id
JOIN SpotifyClone.songs as s
ON r.songs_id = s.id
ORDER BY 1,2;
