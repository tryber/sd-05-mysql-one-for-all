CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT art.artista_nome AS artista,
  album_nome AS album,
  COUNT(usuario_id) AS seguidores
FROM SpotifyClone.artista AS art
  INNER JOIN SpotifyClone.album AS alb ON (art.artista_id = alb.artista_id)
  INNER JOIN SpotifyClone.usuario_artista AS usr ON (art.artista_id = usr.artista_id)
GROUP BY art.artista_nome,
  album_nome
ORDER BY 3 DESC,
  1,
  2;
