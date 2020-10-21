-- Crie uma function chamada de quantidade_musicas_no_historico que exibe a quantidade de músicas
-- que estão presentes atualmente no histórico de reprodução de uma pessoa usuária.
-- Ao receber o código identificador da pessoa,
-- exiba a quantidade de canções em seu histórico de reprodução.

USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(idUser INT)
RETURNS INT READS SQL DATA

BEGIN
DECLARE numReproducoes INT;
SELECT COUNT(h.cancao_id) FROM SpotifyClone.historico_de_reproducoes AS h WHERE h.usuario_id = idUser
INTO numReproducoes;
RETURN numReproducoes;
END $$

DELIMITER ;

-- SELECT quantidade_musicas_no_historico(3); -- 3 sendo o id de 'Bill', retorno certo no WorkBench
