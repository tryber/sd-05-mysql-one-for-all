CREATE VIEW perfil_artistas as
SELECT artista, album,
count(seguidorId) as seguidores from artistas
inner join albuns
on albuns.artistaId = artistas.artistaId
inner join seguidores
on seguidores.artistaId = artistas.artistaId
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;
