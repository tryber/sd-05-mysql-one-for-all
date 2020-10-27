CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome AS usuario,
c.nome AS nome FROM historico_de_reproducoes AS hr
INNER JOIN usuarios AS u ON hr.usuario_id = u.usuario_id
INNER JOIN cancoes AS c ON c.cancao_id = hr.cancao_id
ORDER BY usuario, nome;
