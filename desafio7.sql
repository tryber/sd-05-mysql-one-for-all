CREATE VIEW perfil_artistas AS
SELECT art.artista_nome as artista, alb.album as album, count(fol.usuario_id) as seguidores FROM SpotifyClone.Seguidores as fol
JOIN SpotifyClone.Artista AS art
ON fol.artista_id = art.artista_id
JOIN SpotifyClone.Album AS alb
ON art.artista_id = alb.artista_id
GROUP BY alb.album_id
ORDER BY seguidores DESC, artista, album
