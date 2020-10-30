CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.USUARIO AS 'usuario', c.CANCOES AS 'nome'
    FROM
        historico AS h
            INNER JOIN
        cancoes AS c ON h.CANCOES_ID = c.CANCOES_ID
            INNER JOIN
        usuario AS u ON u.USUARIO_ID = h.USUARIO_ID
    ORDER BY u.USUARIO , c.CANCOES;
