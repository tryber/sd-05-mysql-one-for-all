CREATE VIEW top_2_hits_do_momento AS
SELECT 
M.musica_nome AS cancao,
COUNT(H.musica_id) AS reproducoes
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico_de_reproducoes AS H ON H.musica_id = M.musica_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
