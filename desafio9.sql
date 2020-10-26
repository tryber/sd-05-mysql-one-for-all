DELIMITER $$
CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN nome VARCHAR(50))
BEGIN
SELECT A.nome_artista AS artista, AL.nome_album AS album
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.album AS AL
ON A.id = AL.artista_id
WHERE A.nome_artista = nome
ORDER BY album;
END $$
DELIMITER ;
