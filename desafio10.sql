DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(search_userID INT(4))
RETURNS INT(4) READS SQL DATA
BEGIN
DECLARE qty_music INT;
SELECT COUNT(LH.song_id) FROM listenning_history AS LH
INNER JOIN users as U ON U.user_id = LH.user_id
WHERE U.user_id = search_userID INTO qty_music;
RETURN qty_music;
END 
$$ DELIMITER ;
