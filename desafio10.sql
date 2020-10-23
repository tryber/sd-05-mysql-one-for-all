DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user VARCHAR
(25)) RETURNS INTEGER
READS SQL DATA

BEGIN
    DECLARE quantos INTEGER;

SELECT
    COUNT(*)
INTO quantos
FROM SpotifyClone.historico_de_reproducoes h, SpotifyClone.usuario u
WHERE h.usuario_id = u.usuario_id AND u.usuario_id = user
;

RETURN quantos;
END $$
DELIMITER ;
