-- Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:
-- 
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
-- 
-- A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida pela pessoa com base no seu histórico de reprodução.
-- 
-- Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética e em caso de empate no nome os resultados devem ser ordenados pelo 
-- nome da canção em ordem alfabética.
-- 
-- Sua VIEW deve retornar a seguinte informação, ao ser consultada:

SELECT
U.name AS `usuario`,
C.name AS `nome`
FROM SpotifyClone.historico_de_reproducoes HR
INNER JOIN SpotifyClone.usuario U ON HR.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.cancoes C ON HR.cancoes_id = C.cancoes_id
ORDER BY `usuario`, `nome`;
