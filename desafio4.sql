CREATE VIEW top_3_artistas AS
SELECT A.artist_name AS artista , COUNT(F.artist_id) as seguidores FROM artists AS A
INNER JOIN followers AS F ON A.artist_id = F.artist_id
GROUP BY artista ORDER BY seguidores DESC LIMIT 3;
