DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtd_musicas INT;
SELECT COUNT(user_id) FROM SpotifyClone.reproduction
WHERE id = user_id
INTO qtd_musicas;
RETURN qtd_musicas;
END
$$ DELIMITER;
