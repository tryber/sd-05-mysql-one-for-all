-- Crie uma trigger chamada trigger_usuario_delete
-- Deve ser disparada sempre que uma pessoa usuária for excluída do banco de dados,
-- refletindo essa exclusão em todas as tabelas que ela estiver.
-- Teste a funcionalidade correta de sua trigger, fazendo a exclusão da usuária "Thati".

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.seguindo_artistas WHERE usuario_id = OLD.usuario_id;
  DELETE FROM SpotifyClone.historico_de_reproducoes WHERE usuario_id = OLD.usuario_id;
    -- mapeando todas as tabelas onde usuario aparecer e usando OLD, ref sintaxe e palavras chave: https://www.devmedia.com.br/triggers-pl-sql-saiba-quando-e-por-que-usar/30011
END $$

DELIMITER ;

-- SET SQL_SAFE_UPDATES = 0;
-- DELETE FROM SpotifyClone.usuarios WHERE usuario_nome = 'Thati';
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`SpotifyClone`.`historico_de_reproducoes`, CONSTRAINT `historico_de_reproducoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`))
-- SELECT * FROM SpotifyClone.usuarios;
-- SELECT * FROM SpotifyClone.historico_de_reproducoes;
-- SELECT * FROM SpotifyClone.seguindo_artistas;
