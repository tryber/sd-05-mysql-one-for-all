DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(idUsuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE musicasQuant INT;
SELECT COUNT(h.cancao_id)
FROM SpotifyClone.historico_de_reproducoes AS h
WHERE h.usuario_id = idUsuario
INTO musicasQuant;
RETURN musicasQuant;
END $$
DELIMITER ;
SELECT quantidade_musicas_no_historico(1);
