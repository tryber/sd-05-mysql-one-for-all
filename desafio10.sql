DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE qtdeRep INT;
	SELECT
	COUNT(cancao_id)
	INTO qtdeRep
	FROM SpotifyClone.historico_reproducao
	WHERE usuario_id = id;
	RETURN qtdeRep;
END $$
DELIMITER ;
