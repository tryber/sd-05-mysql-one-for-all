DELIMITER $$ CREATE FUNCTION SpotifyClone.quantidade_musicas_no_historico (usuarioID INT) RETURNS INT READS SQL DATA BEGIN
DECLARE resultado INT;
SELECT COUNT(1)
FROM SpotifyClone.historico_reproducao AS his
WHERE his.usuario_id = usuarioID
LIMIT 1 INTO resultado;
RETURN resultado;
END $$ DELIMITER;
