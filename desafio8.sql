DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.user 
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.reproduction WHERE user_id = OLD.user_id;
DELETE FROM SpotifyClone.follow_artist WHERE user_id = OLD.user_id;
END 
$$ DELIMITER;
