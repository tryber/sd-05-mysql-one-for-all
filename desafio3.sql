CREATE VIEW historico_reproducao_usuarios AS
  SELECT DISTINCT u.USUARIO AS 'usuario',
  c.CANCOES AS 'nome'
  FROM SpotifyClone.usuario AS u, SpotifyClone.cancoes AS c
    GROUP BY CANCOES,
    ORDER BY USUARIO ASC, CANCOES ASC;
    