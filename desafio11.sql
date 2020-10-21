CREATE VIEW IF NOT EXISTS SpotifyClone.cancoes_premium AS
SELECT can.cancao_nome AS `nome`, COUNT(1) AS `reproducoes`
FROM SpotifyClone.cancao AS can
  INNER JOIN SpotifyClone.historico_reproducao AS his ON (can.cancao_id = his.cancao_id)
GROUP BY can.cancao_nome
ORDER BY nome;
