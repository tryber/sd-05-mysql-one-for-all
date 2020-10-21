-- Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, com a quantidade de seguidores que ela possuir.
-- Crie uma VIEW chamada perfil_artistas, com as seguintes colunas:
-- A primeira coluna deve exibir o nome da pessoa artista, com o alias "artista".
-- A segunda coluna deve exibir o nome do álbum, com o alias "album".
-- A terceira coluna deve exibir a quantidade de pessoas seguidoras do artista, com alias "seguidores".
-- Resultados ordenados de forma decrescente, baseando-se no número de pessoas seguidoras.
-- Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética
-- e caso há artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.

CREATE VIEW perfil_artistas AS
SELECT
art.artista_nome AS 'artista',
alb.album_titulo AS 'album',
COUNT(sa.usuario_id) AS 'seguidores'
FROM SpotifyClone.seguindo_artistas AS sa
JOIN SpotifyClone.artistas AS art ON art.artista_id = sa.artista_id
JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id -- duas etapas para chegar até album
GROUP BY `artista`, `album`
-- Para consertar o "Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'SpotifyClone.art.artista_nome' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by"
ORDER BY `seguidores` DESC, `artista`, `album`;
-- ORDER BY 3 DESC, 1, 2;
