CREATE VIEW top_2_hits_do_momento AS
SELECT C.nome_cancao AS cancao, COUNT(*) AS reproducoes
FROM SpotifyClone.cancao C
INNER JOIN SpotifyClone.historico_de_reproducoes HR
ON C.id = HR.cancao_id
GROUP BY C.nome_cancao, HR.cancao_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;

-- SELECT * FROM top_2_hits_do_momento;
