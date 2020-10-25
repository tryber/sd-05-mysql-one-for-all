USE SpotifyClone;
DELIMITER $$;

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
	DELETE FROM reproducao WHERE usuario_id = OLD.id;
    DELETE FROM seguindo WHERE usuario_id = OLD.id;
END $$;
DELIMITER ;
