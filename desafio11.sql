-- Crie uma VIEW chamada cancoes_premium que exiba o nome e a quantidade de vezes que cada canção foi tocada por pessoas usuárias do
--  plano familiar ou universitário, de acordo com os detalhes a seguir:
-- 
-- A primeira coluna deve exibir o nome da canção, com o alias "nome";
-- 
-- A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
-- 
-- Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.
-- 
-- Sua VIEW deve retornar a seguinte informação, ao ser consultada:
CREATE VIEW cancoes_premium AS
SELECT
c.name as `nome`,
COUNT(*) AS 'reproducoes'
FROM SpotifyClone.historico_de_reproducoes h, SpotifyClone.cancoes c, SpotifyClone.usuario u
WHERE h.cancoes_id = c.cancoes_id AND u.usuario_id = h.usuario_id AND u.plano_id IN (2, 3)
GROUP BY `nome`
ORDER BY `nome`
;
