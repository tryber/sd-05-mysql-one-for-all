-- Crie uma VIEW chamada cancoes_premium que exiba o nome e a quantidade de vezes que
-- cada canção foi tocada por pessoas usuárias do plano familiar ou universitário, de acordo com os detalhes a seguir:
-- A primeira coluna deve exibir o nome da canção, com o alias "nome";
-- A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
-- Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.

CREATE VIEW cancoes_premium AS
SELECT sg.song_title AS 'nome',
COUNT(sh.song_id) AS 'reproducoes'
FROM SpotifyClone.songs AS sg
INNER JOIN SpotifyClone.songs_history AS sh ON sh.song_id = sg.song_id
INNER JOIN SpotifyClone.users AS us ON us.user_id = sh.user_id
WHERE us.plan_id IN(2,3)
GROUP BY sg.song_id
ORDER BY 1;
