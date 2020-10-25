USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuarios_id int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE repro_total INT;
SELECT COUNT(usuarios_id)
FROM SpotifyClone.historico_de_reproducoes
WHERE SpotifyClone.historico_de_reproducoes.usuarios_id = usuarios_id INTO repro_total;
RETURN repro_total;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
