CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT can.cancao_nome AS `nome`,
  COUNT(1) AS `reproducoes`
FROM SpotifyClone.cancao AS can
  INNER JOIN SpotifyClone.historico_reproducao AS his ON (can.cancao_id = his.cancao_id)
  INNER JOIN SpotifyClone.usuario AS usr ON (his.usuario_id = usr.usuario_id)
  INNER JOIN SpotifyClone.plano AS pln ON (usr.plano_id = pln.plano_id)
WHERE pln.plano_descricao IN ("universitário", "familiar")
GROUP BY nome
ORDER BY nome;
