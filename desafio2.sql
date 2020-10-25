CREATE VIEW estatisticas_musicais as
SELECT count(cancoes_id) AS cancoes,
(SELECT count(artista_nome) FROM SpotifyClone.Artista) as artistas,
(SELECT count(album_id) FROM SpotifyClone.Album) as albuns
FROM SpotifyClone.Canções;
