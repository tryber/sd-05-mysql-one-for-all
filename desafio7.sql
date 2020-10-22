-- Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, com a quantidade de seguidores que ela possui, de acordo com os detalhes a seguir. 
-- Para tal, crie uma VIEW chamada perfil_artistas, com as seguintes colunas:
-- A primeira coluna deve exibir o nome da pessoa artista, com o alias "artista".
-- A segunda coluna deve exibir o nome do álbum, com o alias "album".
-- A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui e deve possuir o alias "seguidores".
-- Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras.
-- Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética e caso há artistas com o mesmo nome, 
-- ordene os resultados pelo nome do álbum alfabeticamente.

-- Seleção das informações solicitadas, join pra agrupar e ponto de atenção - group by deve ser feito pelo album (valor de referência entre as 3 tabelas)

CREATE VIEW perfil_artistas AS SELECT
a.artista AS 'artista',
alb.album AS 'album',
COUNT(s.usuario_id) AS 'seguidores'
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS alb ON a.artista_id = alb.artista_id
INNER JOIN SpotifyClone.seguidores AS s ON a.artista_id = s.artista_id
GROUP BY alb.album_id
ORDER BY 3 DESC, 1, 2;
