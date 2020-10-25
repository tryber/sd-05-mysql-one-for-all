DELIMITER $$
CREATE TRIGGER SpotifyClone.trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM  reproducao
WHERE usuario_id = OLD.usuario_id;
DELETE FROM seguidos 
WHERE usuario_id = OLD.usuario_id;
END
$$ DELIMITER ;
