USE SpotifyClone;

DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;

DELIMITER %%
CREATE FUNCTION quantidade_musicas_no_historico (id_usuario VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE total_historico INT;
SELECT COUNT(H.usuario_id) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.historico AS H
WHERE H.usuario_id = id_usuario
INTO total_historico;
RETURN total_historico;
END %%
DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
