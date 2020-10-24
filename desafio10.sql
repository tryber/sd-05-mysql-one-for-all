USE Spotifyclone;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(
usuario_id int
)

RETURNS INT READS SQL DATA
BEGIN

DECLARE music_in_history INT;

SELECT COUNT(cancao_id)
FROM SpotifyClone.historico_de_reproducoes H
WHERE H.usuario_id = usuario_id INTO music_in_history;

RETURN music_in_history;

END $$
DELIMITER ;
