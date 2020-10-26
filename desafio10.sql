DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico( usr INT)
RETURNS INT READS SQL DATA

BEGIN
DECLARE reprod INT;
SELECT count(rep.cancoes_id)
FROM SpotifyClone.Historico as rep
WHERE rep.usuario_id = usr
INTO reprod;
RETURN reprod;
END

$$ DELIMITER ;
