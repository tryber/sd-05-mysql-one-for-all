CREATE VIEW `estatisticas_musicais` AS
SELECT (SELECT COUNT(musica_id) cancoes FROM SpotifyClone.musicas) cancoes,
(SELECT COUNT(artista_id) artistas FROM SpotifyClone.artistas) artistas,
(SELECT COUNT(album_id) albuns FROM SpotifyClone.albuns) albuns;
