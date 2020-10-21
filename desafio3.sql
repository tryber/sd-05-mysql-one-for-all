-- Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
-- A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida pela pessoa com base no seu histórico de reprodução.
-- Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética e em caso de empate no nome 
-- os resultados devem ser ordenados pelo nome da canção em ordem alfabética

-- Seleciona primeiro as tabelas com os alias de interesse e faz o JOIN da tabela de assinantes e histórico
-- com a tabela de musicas (vínculo id)

CREATE VIEW historico_reproducao_usuarios AS SELECT
ass.usuario AS 'usuario',
mus.cancoes AS 'nome'
FROM SpotifyClone.assinantes AS ass
JOIN SpotifyClone.historico AS hist ON ass.usuario_id = hist.usuario_id
JOIN SpotifyClone.musicas AS mus ON mus.cancoes_id = hist.cancoes_id
ORDER BY usuario, nome;
