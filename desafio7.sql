CREATE VIEW perfil_artistas AS
SELECT A.nome_artista AS artista, AL.nome_album AS album, COUNT(*) AS seguidores
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.album AS AL
ON A.id = AL.artista_id
INNER JOIN SpotifyClone.usuario_seguindo_artista AS USA
ON A.id = USA.artista_id
GROUP BY A.nome_artista, AL.nome_album, USA.artista_id
ORDER BY seguidores DESC, artista ASC, album ASC;

-- select * from perfil_artistas;
-- drop view perfil_artistas;
