CREATE VIEW perfil_artistas AS
SELECT ar.nome AS artista,
al.título AS album,
COUNT(s.artista) AS seguidores
FROM SpotifyClone.álbuns AS al
INNER JOIN SpotifyClone.artistas AS ar
ON al.artista = ar.id
INNER JOIN SpotifyClone.seguidores AS s
ON al.artista = s.artista
GROUP BY s.artista, al.título
ORDER BY `seguidores` DESC, ar.nome, al.título;
