DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usr_id INT(4))
RETURNS INT READS SQL DATA
BEGIN 
DECLARE coluna INT;
SELECT COUNT(rep.usuario_id)
FROM SpotifyClone.reproducao AS rep
WHERE usuario_id = usr_id
INTO coluna;
RETURN coluna;
END;

SELECT quantidade_musicas_no_historico(3);
