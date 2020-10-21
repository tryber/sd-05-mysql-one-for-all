-- USE SpotifyClone;
-- DROP FUNCTION quantidade_musicas_no_historico;
-- SELECT quantidade_musicas_no_historico(3);

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas_no_historico INT;
SELECT COUNT(user_id)
FROM SpotifyClone.music_history
WHERE user_id = id
INTO quantidade_musicas_no_historico;
RETURN quantidade_musicas_no_historico;
END $$
DELIMITER ;
