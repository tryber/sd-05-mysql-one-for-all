CREATE VIEW top_3_artistas AS
SELECT art.artista_nome as artista, count(fol.usuario_id) as seguidores
FROM SpotifyClone.Seguidores as fol
JOIN SpotifyClone.Artista as art
ON fol.artista_id = art.artista_id
GROUP BY art.artista_id
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
