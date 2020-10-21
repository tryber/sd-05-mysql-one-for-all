-- Crie uma VIEW chamada cancoes_premium que exiba o nome e a quantidade de vezes que cada canção foi tocada por 
-- pessoas usuárias do plano familiar ou universitário, de acordo com os detalhes a seguir:
-- A primeira coluna deve exibir o nome da canção, com o alias "nome";
-- A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
-- Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.
USE SpotifyClone;

-- DROP VIEW cancoes_premium;

CREATE VIEW cancoes_premium AS SELECT
m.cancoes AS nome,
COUNT(h.cancoes_id) AS reproducoes
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico AS h ON m.cancoes_id = h.cancoes_id
INNER JOIN SpotifyClone.assinantes AS a ON a.usuario_id = h.usuario_id
WHERE a.plano_id IN(2,3)
GROUP BY m.cancoes_id
ORDER BY nome;
