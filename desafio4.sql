CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT art.artista_nome AS artista,
  COUNT(usrart.usuario_id) AS seguidores
FROM SpotifyClone.artista AS art
  INNER JOIN SpotifyClone.usuario_artista AS usrart ON (art.artista_id = usrart.artista_id)
GROUP BY art.artista_id
ORDER BY 2 DESC,
  1
LIMIT 3;
