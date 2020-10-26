DELIMITER $$
USE SpotifyClone;
CREATE TRIGGER trigger_usuario_delete BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM seguindo_artista WHERE usuario_id = OLD.usuario_id;
DELETE FROM reproducao where usuarios_usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
