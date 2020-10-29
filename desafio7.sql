CREATE VIEW perfil_artistas AS
SELECT
a.name as artista,
b.name as album,
COUNT(*) AS seguidores
FROM SpotifyClone.seguindo_artistas AS s, SpotifyClone.artista as a, SpotifyClone.album AS b
WHERE s.artista_id = a.artista_id AND a.artista_id = b.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;
