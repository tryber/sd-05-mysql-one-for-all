DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (idIn INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE result INT;
SELECT COUNT(*) FROM SpotifyClone.reproductions AS r
WHERE r.usuario_id = idIn
INTO result;
RETURN result;
END $$
DELIMITER ;
