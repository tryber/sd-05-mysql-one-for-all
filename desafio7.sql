CREATE VIEW perfil_artistas AS
SELECT a.nome_artista artista,
al.nome_album album,
COUNT(sa.artista_id) seguidores
FROM SpotifyClone.seguindo_artista AS sa
INNER JOIN SpotifyClone.artistas AS a
ON sa.artista_id = a.artista_id
INNER JOIN SpotifyClone.albuns AS al
ON al.artista_id = a.artista_id
GROUP BY al.album_id
ORDER BY seguidores DESC, artista, album;
