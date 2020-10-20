-- Crie uma VIEW com o nome top_3_artistas que deve mostrar somente as três pessoas artistas mais populares no banco SpotifyClone, possuindo as seguintes colunas:
-- 
-- A primeira coluna deve possuir o alias "artista" e exibir o nome da pessoa artista.
-- 
-- A segunda coluna deve ter o alias "seguidores" e exibir a quantidade de pessoas que estão seguindo aquela pessoa artista.
-- 
-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se na quantidade de seguidores. Em caso de empate, ordene os resultados pelo nome da pessoa 
-- artista em ordem alfabética.
-- 
-- Sua VIEW deve retornar a seguinte informação, ao ser consultada:

CREATE VIEW top_3_artistas AS 
SELECT
ar.name as `artista`,
COUNT(*) AS `seguidores`
FROM SpotifyClone.seguindo_artistas AS sa, SpotifyClone.artista as ar
WHERE sa.artista_id = ar.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`  LIMIT 3;
