CREATE VIEW perfil_artistas AS
SELECT
A.name as artista,
AL.name as album,
COUNT(*) AS seguidores
FROM SpotifyClone.seguindo_artistas AS S, SpotifyClone.artista as A, SpotifyClone.album AS AL
WHERE S.artista_id = A.artista_id AND A.artista_id = AL.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;
