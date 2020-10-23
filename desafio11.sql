CREATE VIEW cancoes_premium AS
SELECT M.cancoes AS 'nome' ,
COUNT(R.usuario_id) AS 'reproducoes'
FROM SpotifyClone.musicas M 
INNER JOIN SpotifyClone.historico_de_reproducoes R
ON M.id = R.cancao_id
INNER JOIN SpotifyClone.usuarios U
ON U.id = R.usuario_id
WHERE plano_id <>1
GROUP BY `nome`
ORDER BY `nome`;
