CREATE VIEW perfil_artistas AS
SELECT 
a.nome AS artista,
al.nome AS album,
COUNT(f.usuario_id) AS seguidores
FROM SpotifyClone.follow AS f, SpotifyClone.artist as a, SpotifyClone.album AS al
WHERE f.artist_id = a.id AND a.id = al.artist_id
GROUP BY artista, album
ORDER BY 3 DESC, 1, 2;

-- pq não funciona com JOIN como nos outros?!
-- JOIN SpotifyClone.artist as a
-- ON f.artist_id = a.id
-- JOIN SpotifyClone.album AS al
-- ON a.id = al.artist_id
