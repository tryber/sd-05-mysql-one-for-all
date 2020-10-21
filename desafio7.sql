CREATE VIEW perfil_artistas AS
SELECT A.artist_name AS artista, ALB.album_name as album, COUNT(F.artist_id) AS seguidores
FROM artists as A 
INNER JOIN albums as ALB ON ALB.artist_id = A.artist_id
INNER JOIN followers as F ON F.artist_id = A.artist_id
GROUP BY  ALB.album_id;
