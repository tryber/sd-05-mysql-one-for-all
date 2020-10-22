DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
before delete on usuarios
for each row
begin
SET foreign_key_checks = 0;
DELETE FROM historico_de_reproducoes
WHERE historico_de_reproducoes.usuario_id = OLD.usuarioId;
DELETE FROM seguidores
WHERE OLD.usuarioId = seguidores.seguidorId;
SET foreign_key_checks = 1;
END; $$
DELIMITER ;
