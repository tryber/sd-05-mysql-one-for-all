DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usuario_id int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE soma_musicas INT;
SELECT COUNT(musica_id) FROM SpotifyClone.historico
WHERE SpotifyClone.historico.usuario_id = usuario_id INTO soma_musicas;
RETURN soma_musicas;
END $$
DELIMITER ;


