CREATE VIEW perfil_artistas AS
SELECT 
A.artista_nome AS artista,
AL.album_nome AS album,
COUNT(S.usuario_id) AS seguidores
FROM SpotifyClone.seguidores AS S
INNER JOIN SpotifyClone.artistas AS A ON A.artista_id = S.artista_id
INNER JOIN SpotifyClone.albuns AS AL ON AL.artista_id = S.artista_id
GROUP BY AL.album_id
ORDER BY seguidores DESC, artista ASC, album ASC;
