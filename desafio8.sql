DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico_de_reproducoes
WHERE usuario_id = OLD.id;
DELETE FROM SpotifyClone.usuario_seguindo_artista
WHERE usuario_id = OLD.id;
END;
DELIMITER $$ ;
