CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user_name usuario, s.song_name nome
FROM SpotifyClone.reproduction r INNER JOIN SpotifyClone.user u
ON u.user_id = r.user_id
INNER JOIN SpotifyClone.song s
ON s.song_id = r.song_id
ORDER BY usuario, nome;
