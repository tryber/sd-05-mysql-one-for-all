CREATE VIEW top_2_hits_do_momento AS
SELECT M.cancoes AS 'cancao' , count(*) AS 'reproducoes'
FROM SpotifyClone.historico_de_reproducoes R
INNER JOIN SpotifyClone.musicas M
ON M.id = R.cancao_id
INNER JOIN SpotifyClone.usuarios U
ON U.id = R.usuario_id
GROUP BY R.cancao_id
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
