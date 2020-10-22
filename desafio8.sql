DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    AFTER DELETE ON usuários
    FOR EACH ROW
BEGIN
    DELETE FROM seguidores WHERE seguidores.usuário = usuários.id;
	DELETE FROM reproduções WHERE reproduções.usuário = usuários.id;
END; $$
DELIMITER ;
