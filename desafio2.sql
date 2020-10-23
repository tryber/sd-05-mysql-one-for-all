-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".

CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT sg.song_title) AS 'cancoes',
COUNT(DISTINCT art.artist_name) AS 'artistas',
COUNT(DISTINCT alb.album_title) AS 'albuns'
FROM SpotifyClone.songs AS sg, SpotifyClone.artists AS art, SpotifyClone.albums AS alb;
