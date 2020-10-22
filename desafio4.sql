-- Crie uma VIEW com o nome top_3_artistas que deve mostrar somente as três pessoas artistas mais populares no banco SpotifyClone, possuindo as seguintes colunas:
-- A primeira coluna deve possuir o alias "artista" e exibir o nome da pessoa artista.
-- A segunda coluna deve ter o alias "seguidores" e exibir a quantidade de pessoas que estão seguindo aquela pessoa artista.
-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se na quantidade de seguidores. 
-- Em caso de empate, ordene os resultados pelo nome da pessoa artista em ordem alfabética.

-- Select com INNER JOIN pra pegar as informações das duas tabelas, dois pontos de atenção deve sempre agrupar as informações por um campo único e o limite de 3 artistas

CREATE VIEW top_3_artistas AS SELECT
art.artista AS 'artista',
COUNT(s.usuario_id) AS 'seguidores'
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.seguidores AS s ON art.artista_id = s.artista_id
GROUP BY s.artista_id
ORDER BY 2  DESC, 1
LIMIT 3;
