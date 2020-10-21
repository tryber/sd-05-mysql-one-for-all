-- USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
SELECT 
COUNT(DISTINCT m.music_name) AS 'cancoes',
COUNT(DISTINCT art.artist_name) AS 'artistas',
COUNT(DISTINCT alb.album_name) AS 'albuns'
FROM SpotifyClone.musics AS m, SpotifyClone.artists AS art, SpotifyClone.albums AS alb;
