-- Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento. Crie uma VIEW 
-- chamada top_2_hits_do_momento que possua duas colunas:
-- 
-- A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.
-- 
-- A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já escutaram a canção em questão.
-- 
-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções. Em caso de empate, ordene os resultados pelo nome da canção em 
-- ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.
-- 
-- Sua VIEW deve retornar a seguinte informação, ao ser consultada:
CREATE VIEW top_2_hits_do_momento AS
SELECT
c.name AS `cancao`,
COUNT(*) AS `reproducoes`
FROM SpotifyClone.historico_de_reproducoes h, SpotifyClone.cancoes c
WHERE h.cancoes_id = c.cancoes_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` LIMIT 2;
