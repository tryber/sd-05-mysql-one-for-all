DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(us VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE rep INT;
SELECT COUNT(h.song_id)
FROM SpotifyClone.historic AS h
INNER JOIN SpotifyClone.users AS u
ON h.user_id = u.user_id
WHERE u.user_id = us
INTO rep;
RETURN rep;
END $$

DELIMITER ;
