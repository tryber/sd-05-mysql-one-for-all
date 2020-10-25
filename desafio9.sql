DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100))
BEGIN 
SELECT a.artista AS "artista", al.album AS "album"
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.album AS al ON a.artista_id = al.artista_id
WHERE `artista` = nome;
END $$
DELIMITER ;
CALL albuns_do_artista('Walter Phoenix');
