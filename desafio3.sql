-- USE SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.user_name AS 'usuario',
m.music_name AS 'nome'
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.music_history AS mh ON u.id = mh.user_id
INNER JOIN SpotifyClone.musics AS m ON mh.music_id = m.id
ORDER BY 1, 2;

-- SELECT * FROM historico_reproducao_usuarios;