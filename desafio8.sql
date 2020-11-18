DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico_de_reproducoes
WHERE usuarios_id = OLD.usuarios_id;
DELETE FROM SpotifyClone.seguindo_artistas
WHERE usuarios_id = OLD.usarios_id;
END $$

DELIMITER ;
