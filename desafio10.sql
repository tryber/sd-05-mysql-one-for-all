DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuar INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE reprod INT;
SELECT COUNT(r.cancao_id)
FROM SpotifyClone.reproducao AS r
WHERE r.usuario_id = usuar
INTO reprod;
RETURN reprod;
END $$

DELIMITER ;
