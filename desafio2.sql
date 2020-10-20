-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- 
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "'".
-- 
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- 
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".
CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT c.name) AS 'cancoes',
COUNT(DISTINCT ar.name) AS 'artistas',
COUNT(DISTINCT al.name) AS 'albuns'
FROM SpotifyClone.album as al, SpotifyClone.artista as ar, SpotifyClone.cancoes as c;
