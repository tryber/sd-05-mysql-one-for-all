DELIMITER //
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN 
DELETE FROM SpotifyClone.hreprodução WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.seguidores WHERE usuario_id = OLD.usuario_id;
END
// DELIMITER ;
