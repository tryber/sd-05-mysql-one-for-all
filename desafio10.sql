DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (nome VARCHAR(100)) RETURNS INT
BEGIN
DECLARE saida INT;
SET saida = 0;
SELECT COUNT(R.usuarios_usuario_id)
FROM SpotifyClone.reproducao AS R
JOIN SpotifyClone.usuarios AS U ON  R.usuarios_usuario_id = U.usuario_id
WHERE nome=U.usuario
GROUP BY usuario INTO saida;
RETURN saida;
END $$
DELIMITER ;
