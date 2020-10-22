/*
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuarioNome VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidadeMusicas INT;
SELECT COUNT(*) AS quantidade_musicas_no_historico 
FROM SpotifyClone.reproduções AS r
INNER JOIN SpotifyClone.usuários AS u
ON r.usuário = u.id
WHERE u.nome = usuarioNome
INTO quantidadeMusicas;
RETURN quantidadeMusicas;

END $$

DELIMITER ;
*/

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(idUser INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidadeMusicas INT;
SELECT COUNT(*) INTO quantidadeMusicas
FROM SpotifyClone.reproduções
WHERE usuario = idUser;
RETURN quantidadeMusicas;

END $$

DELIMITER ;
