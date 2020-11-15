DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nomeDoArtista VARCHAR(50))
BEGIN
  SELECT
  art.nome_artista AS 'artista',
  alb.titulo_album AS 'album'
  FROM SpotifyClone.albuns AS alb
  INNER JOIN SpotifyClone.artistas AS art
  ON art.artista_id = alb.artista_id
  WHERE art.nome_artista = nomeDoArtista;
END $$
DELIMITER ;
