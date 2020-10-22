CREATE VIEW perfil_artistas AS
SELECT
  (SELECT artista FROM SpotifyClone.artistas 
  WHERE artistas.id = albuns.id_artista) AS artista, album AS album,
  (SELECT COUNT(*) FROM SpotifyClone.seguidores
WHERE seguidores.id_artista = albuns.id_artista) AS seguidores FROM SpotifyClone.albuns
ORDER BY seguidores DESC, artista, album;
