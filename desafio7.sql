CREATE VIEW perfil_artistas AS
SELECT A.artista AS artista, AB.album AS album,
COUNT(S.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS A
JOIN SpotifyClone.albuns AS AB ON A.artist_id = AB.artistas_artist_id
JOIN SpotifyClone.seguindo_artista AS S ON S.artist_id = A.artist_id
GROUP BY artista,album
ORDER BY seguidores DESC;
