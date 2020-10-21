-- Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento.
-- Crie uma VIEW chamada top_2_hits_do_momento que possua duas colunas:
-- A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.
-- A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já escutaram a canção em questão.
-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções.
-- Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética.
-- Queremos apenas o top 2 de músicas mais tocadas.

CREATE VIEW top_2_hits_do_momento AS 
SELECT 
sg.song_title AS 'cancao',
COUNT(sh.user_id) AS 'reproducoes'
FROM SpotifyClone.songs AS sg
INNER JOIN SpotifyClone.songs_history AS sh ON sh.song_id = sg.song_id
GROUP BY sh.song_id
ORDER BY 2 DESC, 1
LIMIT 2;
