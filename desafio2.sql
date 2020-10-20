-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".

-- USE SpotifyClone; nao passa no teste

CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT c.cancao_titulo) AS 'cancoes',
COUNT(DISTINCT art.artista_nome) AS 'artistas',
COUNT(DISTINCT alb.album_titulo) AS 'albuns'
FROM  SpotifyClone.cancoes AS c, SpotifyClone.artistas AS art, SpotifyClone.albuns AS alb;
