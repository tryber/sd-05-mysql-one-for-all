CREATE FUNCTION quantidade_musicas_no_historico (id SMALLINT)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE result INT;
	SELECT COUNT(R.usuario_id)
	FROM reproducao AS R
	WHERE usuario_id = id
    INTO result;
    RETURN result;
END $$;
DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
