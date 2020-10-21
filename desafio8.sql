-- Crie uma trigger chamada trigger_usuario_delete que deve ser disparada sempre que uma pessoa usuária for excluída do banco de dados,
-- refletindo essa exclusão em todas as tabelas que ela estiver.
-- Teste a funcionalidade correta de sua trigger, fazendo a exclusão da usuária "Thati".

-- Gatilho pra excluir usuários pontos de atenção à sintaxe ; ao final de cada DELETE

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.assinantes
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.seguidores WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
