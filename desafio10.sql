DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(idUsuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE vezes_reproduzidas INT;
SELECT COUNT(cancao_id)
FROM historico_de_reproducoes
WHERE usuario_id = idUsuario INTO vezes_reproduzidas;
RETURN vezes_reproduzidas;
END $$ 
DELIMITER ;
