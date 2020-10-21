-- Crie uma VIEW com o nome top_3_artistas que deve mostrar somente as três pessoas artistas mais populares.
-- A primeira coluna deve possuir o alias "artista" e exibir o nome da pessoa artista.
-- A segunda coluna deve ter o alias "seguidores" e exibir a quantidade de pessoas que estão seguindo.
-- Ordenado em ordem decrescente, baseando-se na quantidade de seguidores.
-- Em caso de empate, ordene os resultados pelo nome da pessoa artista em ordem alfabética.

CREATE VIEW top_3_artistas AS
SELECT
a.artista_nome AS 'artista',
COUNT(sa.usuario_id) AS 'seguidores' 
FROM SpotifyClone.seguindo_artistas AS sa
JOIN SpotifyClone.artistas AS a ON a.artista_id = sa.artista_id
GROUP BY `artista`
ORDER BY 2 DESC, 1 ASC
LIMIT 3;
