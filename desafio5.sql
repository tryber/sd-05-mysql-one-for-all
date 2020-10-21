-- Precisamos saber quais são as duas músicas mais tocadas no momento.
-- Crie uma VIEW chamada top_2_hits_do_momento:
-- A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.
-- A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já escutaram a canção em questão.
-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções.
-- Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética.
-- Queremos apenas o top 2 de músicas mais tocadas.

CREATE VIEW top_2_hits_do_momento AS
SELECT
c.cancao_titulo AS 'cancao',
COUNT(h.usuario_id) AS 'reproducoes' 
FROM SpotifyClone.historico_de_reproducoes AS h
JOIN SpotifyClone.cancoes AS c ON c.cancao_id = h.cancao_id
GROUP BY `cancao`
ORDER BY 2 DESC, 1 ASC
LIMIT 2;
