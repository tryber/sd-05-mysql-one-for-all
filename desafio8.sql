-- https://www.mysqltutorial.org/mysql-delete-join/
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
    DELETE his, art
    FROM SpotifyClone.historico_reproducao AS his
    INNER JOIN SpotifyClone.usuario_artista AS art ON (his.usuario_id = art.usuario_id)
    WHERE his.usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
