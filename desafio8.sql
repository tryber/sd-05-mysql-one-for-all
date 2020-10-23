-- Crie uma trigger chamada trigger_usuario_delete que deve ser disparada sempre que uma pessoa usuária for excluída do banco de dados,
-- refletindo essa exclusão em todas as tabelas que ela estiver.
-- Teste a funcionalidade correta de sua trigger, fazendo a exclusão da usuária "Thati".

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.songs_history WHERE user_id = OLD.user_id;
DELETE FROM SpotifyClone.followers WHERE user_id = OLD.user_id;
END $$
DELIMITER ;
