-- Crie uma function chamada de quantidade_musicas_no_historico que exibe a quantidade de músicas
-- que estão presentes atualmente no histórico de reprodução de uma pessoa usuária.
-- Ao receber o código identificador da pessoa,
-- exiba a quantidade de canções em seu histórico de reprodução.

-- O code seguinte funcionou no Workbench, via a chamada SELECT quantidade_musicas_no_historico(3), sendo 3 o id do usuario 'Bill'.

-- USE SpotifyClone;
DELIMITER $$

-- DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;
CREATE FUNCTION quantidade_musicas_no_historico(idUser INT)
RETURNS INT READS SQL DATA

BEGIN
DECLARE numReproducoes INT;
SELECT
COUNT(cancao_id)
-- LIMIT 1
INTO numReproducoes
FROM SpotifyClone.historico_de_reproducoes
WHERE usuario_id = idUser;

RETURN numReproducoes;
END $$

DELIMITER ;
