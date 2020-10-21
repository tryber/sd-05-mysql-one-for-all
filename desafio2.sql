-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns"

-- Seleção simples usando a função de agregação COUNT e DISTINCT (valores únicos)

CREATE VIEW estatisticas_musicais AS SELECT
COUNT(DISTINCT mus.cancoes) AS 'cancoes',
COUNT(DISTINCT art.artista) AS 'artistas',
COUNT(DISTINCT alb.album) AS 'albuns'
FROM SpotifyClone.musicas AS mus, SpotifyClone.artistas AS art, SpotifyClone.albuns AS alb;
