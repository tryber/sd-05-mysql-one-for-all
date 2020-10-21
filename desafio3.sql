CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT usr.usuario_nome AS usuario,
  can.cancao_nome AS nome
FROM usuario AS usr
  INNER JOIN historico_reproducao AS his ON (his.usuario_id = usr.usuario_id)
  LEFT JOIN cancao AS can ON (his.cancao_id = can.cancao_id)
ORDER BY 1,
  2;
