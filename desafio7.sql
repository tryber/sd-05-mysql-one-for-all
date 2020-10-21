CREATE VIEW perfil_artistas AS
SELECT 
A.artista_nome artista,
AL.album_nome album,
COUNT(S.artista_id) seguidores
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.albuns AS AL ON A.artista_id = AL.artista_id
INNER JOIN SpotifyClone.seguidores AS S ON S.artista_id = A.artista_id
GROUP BY album
ORDER BY seguidores DESC, artista ASC, album ASC;
