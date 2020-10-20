CREATE VIEW historico_reproducao_usuarios AS
SELECT U.user_name AS usuario , S.song_name as nome FROM users AS U
INNER JOIN listenning_history AS LH ON U.user_id = LH.user_id
INNER JOIN songs AS S ON S.song_id = LH.song_id
ORDER BY `usuario`,`nome` ASC;
