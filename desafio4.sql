-- USE SpotifyClone;
-- SELECT * FROM top_3_artistas;

CREATE VIEW top_3_artistas AS
SELECT
a.artist_name AS 'artista',
COUNT(f.user_id) AS 'seguidores'
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.followers AS f ON f.artist_id = a.id
GROUP BY artist_id
ORDER BY 2 DESC, 1;
