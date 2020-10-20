USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(cliente VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE qtde INT;    
    SELECT 
	COUNT(id_cancao)
	FROM historico
    WHERE id_usuario = cliente INTO qtde;
    RETURN qtde;
END $$
DELIMITER ;
