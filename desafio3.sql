/* Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:

 A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.

A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida pela pessoa com base no seu histórico de reprodução.

Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética e em caso de empate no nome os resultados devem ser ordenados pelo nome da canção em ordem alfabética.

Sua VIEW deve retornar a seguinte informação, ao ser consultada: */

CREATE VIEW historico_reproducao_usuarios as
SELECT uzer.usuario as usuario,
ca.cancoes as nome
FROM SpotifyClone.Historico as hist
JOIN SpotifyClone.Usuário as uzer
ON hist.usuario_id = uzer.usuario_id
JOIN SpotifyClone.Canções as ca
ON hist.cancoes_id = ca.cancoes_id
ORDER BY uzer.usuario, ca.cancoes ASC;
