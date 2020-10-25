CREATE VIEW `perfil_artistas` AS
SELECT AR.artista AS artista,
AL.album AS album,
COUNT(S.usuario_id) AS seguidores
FROM SpotifyClone.artista AS AR
INNER JOIN SpotifyClone.album AS AL
ON AL.artista_id = AR.id
INNER JOIN SpotifyClone.seguindo AS S
ON S.artista_id = AR.id
GROUP BY AL.id
ORDER BY seguidores DESC, AR.artista, AL.album;
