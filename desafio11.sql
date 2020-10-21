-- Crie uma VIEW chamada cancoes_premium que exiba o nome e a quantidade de vezes
-- que cada canção foi tocada por pessoas usuárias do plano familiar ou universitário:
-- A primeira coluna deve exibir o nome da canção, com o alias "nome";
-- A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
-- Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.

CREATE VIEW cancoes_premium AS
SELECT
c.cancao_titulo AS 'nome',
COUNT(h.usuario_id) AS 'reproducoes'
FROM SpotifyClone.historico_de_reproducoes AS h
JOIN SpotifyClone.cancoes AS c ON c.cancao_id = h.cancao_id
JOIN SpotifyClone.usuarios AS u ON u.usuario_id = h.usuario_id WHERE u.plano_id IN(2,3)
GROUP BY 1 ORDER BY 1;


-- [Honestidade acadêmica]
-- No decorrer do projeto, recebi ajuda pontual de alunos e consultei os PR seguintes:
-- https://github.com/tryber/sd-05-mysql-one-for-all/pull/8/files Paulo Dandrea
-- https://github.com/tryber/sd-05-mysql-one-for-all/pull/1/files Sidnei Ramos
