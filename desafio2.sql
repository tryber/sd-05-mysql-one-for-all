CREATE VIEW estatisticas_musicais AS
SELECT 
(SELECT COUNT(id_Cancao) AS cancoes FROM SpotifyClone.cancoes),
(SELECT COUNT(artista) AS artistas FROM SpotifyClone.artistas),
(SELECT COUNT(album) AS albuns FROM SpotifyClone.albuns);
