-- Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
-- A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida pela pessoa com base no seu histórico de reprodução.
-- Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética
-- e em caso de empate no nome os resultados devem ser ordenados pelo nome da canção em ordem alfabética.

CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.usuario_nome AS 'usuario',
c.cancao_titulo AS 'nome'
FROM SpotifyClone.historico_de_reproducoes AS h
JOIN SpotifyClone.usuarios AS u ON u.usuario_id = h.usuario_id
JOIN SpotifyClone.cancoes AS c ON c.cancao_id = h.cancao_id -- INNER JOIN implicito
ORDER BY 1, 2;
-- ou ORDER BY `usuario`, `nome`;
