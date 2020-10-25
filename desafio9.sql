USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN syllable VARCHAR(45))
BEGIN
SELECT ar.artista AS artista,
al.album AS `album`
FROM SpotifyClone.artistas AS ar
JOIN
SpotifyClone.albuns AS al
ON(ar.id = al.artistas_id)
WHERE ar.artista LIKE syllable
ORDER BY `album`;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
