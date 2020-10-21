-- Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento. 
-- Crie uma VIEW chamada top_2_hits_do_momento que possua duas colunas:
-- A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.
-- A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já escutaram a canção em questão.
-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções.
-- Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.

-- Seleção das músicas e quantidade de reprodução juntando as informações com INNER JOIN, ordena e limita para apenas 2 resultados

CREATE VIEW top_2_hits_do_momento AS SELECT
m.cancoes AS 'cancao',
COUNT(h.usuario_id) AS 'reproducoes'
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico AS h ON m.cancoes_id = h.cancoes_id
GROUP BY h.cancoes_id
ORDER BY 2 DESC, 1
LIMIT 2;