DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(idUsuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE QuantidadeMusicasEscutadas INT;
SELECT COUNT(h.CANCOES_ID)
FROM SpotifyClone.historico AS h
WHERE h.USUARIO_ID = idUsuario
GROUP BY h.USUARIO_ID
INTO QuantidadeMusicasEscutadas;
RETURN QuantidadeMusicasEscutadas;
END $$
DELIMITER ;
