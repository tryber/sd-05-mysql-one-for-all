-- Crie uma trigger chamada trigger_usuario_delete que deve ser disparada sempre que uma pessoa usuária for excluída do banco de dados, 
-- refletindo essa exclusão em todas as tabelas que ela estiver.
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.seguindo_artistas WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.historico_de_reproducoes WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
-- https://stackoverflow.com/questions/11818191/mysql-trigger-delete-from-table-after-delete