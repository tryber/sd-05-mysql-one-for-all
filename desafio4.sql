CREATE VIEW top_3_artistas AS
SELECT a.artista AS artista,
(SELECT COUNT(*) FROM SpotifyClone.seguindo_artistas AS follow
WHERE a.artista_id = follow.artista_id) AS seguidores 
FROM SpotifyClone.artistas AS a
ORDER BY seguidores DESC, artista
LIMIT 3