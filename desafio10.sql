DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuar VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE reprod INT;
SELECT COUNT(r.cancao_id)
FROM SpotifyClone.reproducao AS r
INNER JOIN SpotifyClone.usuarios AS u
ON r.usuario_id = u.usuario_id
WHERE u.usuario_id = usuar
INTO reprod;
RETURN reprod;
END $$

DELIMITER ;
