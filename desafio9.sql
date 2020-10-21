DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(45))
BEGIN
SELECT 
a.nome AS artista,
al.nome AS album
FROM SpotifyClone.artist as a
JOIN SpotifyClone.album as al
ON a.id = al.artist_id
WHERE a.nome= nomeArtista;
END $$
DELIMITER ;

-- funfou tb?
-- a.nome AS artista,
-- al.nome AS album
-- FROM SpotifyClone.artist as a, SpotifyClone.album as al
-- WHERE a.nome= 'Walter Phoenix' AND a.id = al.artist_id;
