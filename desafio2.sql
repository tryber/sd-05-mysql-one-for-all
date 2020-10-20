	USE spotifyclone;
    
    CREATE VIEW `estatisticas musicais` AS
    SELECT (SELECT COUNT(musica_id) cancoes FROM spotifyclone.musicas) cancoes,
	(SELECT COUNT(artista_id) artistas FROM spotifyclone.artistas) artistas,
    (SELECT COUNT(album_id) albuns FROM spotifyclone.albuns) albuns;
    