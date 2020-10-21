create view top_3_artistas as 
select artista, count(seguidorId) as seguidores from seguidores
inner join artistas
on seguidores.artistaId = artistas.artistaId
GROUP BY artista
HAVING seguidores > 1
ORDER BY seguidores DESC, artista;
