-- use SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
SELECT
nu.nome_usuario AS 'usuario',
tc.titulo_cancao AS 'nome'
FROM SpotifyClone.historico_reproducao AS h
INNER JOIN SpotifyClone.usuario AS nu ON nu.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.cancoes AS tc ON tc.cancao_id = h.cancao_id
ORDER BY 1, 2;
