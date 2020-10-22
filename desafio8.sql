-- Referência: query desenvolvida com a ajuda de Sidnei Ramos
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON usuários
    FOR EACH ROW
BEGIN
DELETE FROM seguidores WHERE seguidores.usuário = OLD.id;
DELETE FROM reproduções WHERE reproduções.usuário = OLD.id;
END; $$
DELIMITER ;
