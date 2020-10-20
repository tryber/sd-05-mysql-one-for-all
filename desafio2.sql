-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".

USE SpotifyClone;

SELECT
COUNT(DISTINCT cancoes.cancao_titulo) AS 'cancoes',
COUNT(DISTINCT artistas.artista_nome) AS 'artistas',
COUNT(DISTINCT albuns.album_titulo) AS 'albuns'
FROM  cancoes, artistas, albuns;
