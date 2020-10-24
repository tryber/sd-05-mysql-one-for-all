-- https://dev.mysql.com/doc/refman/5.7/en/trigger-syntax.html
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users

FOR EACH ROW
BEGIN
  DELETE FROM
    SpotifyClone.song_history
  WHERE
    user_id = OLD.user_id;
  DELETE FROM
    SpotifyClone.following
  WHERE
    user_id = OLD.user_id;
END
$$ DELIMITER ;
