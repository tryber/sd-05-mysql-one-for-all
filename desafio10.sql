-- Crie uma function chamada de quantidade_musicas_no_historico que exibe a quantidade de músicas que estão presentes atualmente no histórico de reprodução de
--  uma pessoa usuária. Ao receber o código identificador da pessoa, exiba a quantidade de canções em seu histórico de reprodução.
-- 
-- Confirme a execução correta da function, chamando-a e passando o id para a pessoa usuária com o nome igual a "Bill". 
-- Sua function deve retornar o mesmo que o resultado abaixo:

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user VARCHAR(25)) RETURNS INTEGER
READS SQL DATA

BEGIN 
DECLARE quantos INTEGER;

SELECT
COUNT(*)
INTO quantos
FROM SpotifyClone.historico_de_reproducoes h, SpotifyClone.usuario u
WHERE h.usuario_id = u.usuario_id AND u.usuario_id = user
;

RETURN quantos;
END$$
DELIMITER ;
-- 
-- SELECT quantidade_musicas_no_historico('Bill');
