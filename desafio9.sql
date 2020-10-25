USE SpotifyClone;
DELIMITER $$;

CREATE PROCEDURE albuns_do_artista(nome VARCHAR(16))
BEGIN
  SELECT A.artista as artista,
    AL.album as album
    FROM artista as A
    INNER JOIN album as AL
    ON AL.artista_id = A.id
    WHERE A.artista = nome;
END $$;
DELIMITER ;