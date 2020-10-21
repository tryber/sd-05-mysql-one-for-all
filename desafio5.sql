CREATE VIEW top_2_hits_do_momento AS
SELECT c.título AS cancao, COUNT(r.canção) AS reproducoes FROM SpotifyClone.canções AS c
INNER JOIN SpotifyClone.reproduções AS r
ON r.canção = c.id
GROUP BY c.id
ORDER BY COUNT(r.canção) DESC, c.título
LIMIT 2; 
