-- Crie uma function chamada de quantidade_musicas_no_historico que exibe a quantidade de músicas que estão presentes 
-- atualmente no histórico de reprodução de uma pessoa usuária. Ao receber o código identificador da pessoa, exiba a quantidade de canções em seu histórico de reprodução.
-- Confirme a execução correta da function, chamando-a e passando o id para a pessoa usuária com o nome igual a "Bill".

-- USE SpotifyClone;
-- DROP FUNCTION quantidade_musicas_no_historico;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas_no_historico INT;
SELECT COUNT(usuario_id)
FROM SpotifyClone.historico
WHERE usuario_id = usuario_id
INTO quantidade_musicas_no_historico;
RETURN quantidade_musicas_no_historico;
END $$
DELIMITER ;