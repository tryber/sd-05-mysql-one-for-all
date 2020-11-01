/* CREATE VIEW historico_reproducao_usuarios AS
SELECT 
(SELECT usr.usuario FROM SpotifyClone.usuarios AS usr WHERE hdr.usuario_id = usr.usuario_id) AS "usuario",
(SELECT c.cancao FROM SpotifyClone.cancoes AS c WHERE hdr.cancao_id = c.cancao_id) AS "nome" 
FROM SpotifyClone.historico_de_reproducoes AS hdr */

-- A subquery acima funciona com um custo melhor sem o ORDER BY porém ao adicionar o
-- order por algum motivo o custo triplica e fica pior que o join...

CREATE VIEW historico_reproducao_usuarios AS
SELECT usr.usuario AS "usuario", c.cancao AS "nome" 
FROM SpotifyClone.usuarios AS usr
INNER JOIN SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_de_reproducoes AS hdr
ON hdr.cancao_id = c.cancao_id AND hdr.usuario_id = usr.usuario_id
ORDER BY usuario, nome;