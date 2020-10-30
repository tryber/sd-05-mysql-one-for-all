CREATE VIEW top_3_artistas AS
    SELECT 
        a.NOME_ARTISTA AS 'artista',
        COUNT(sa.USUARIO_ID) AS 'seguidores'
    FROM
        SpotifyClone.seguindo_artista AS sa
            INNER JOIN
        artista AS a ON a.ARTISTA_ID = sa.ARTISTA_ID
    GROUP BY sa.ARTISTA_ID
    ORDER BY COUNT(sa.USUARIO_ID) DESC , a.NOME_ARTISTA
    LIMIT 3;
