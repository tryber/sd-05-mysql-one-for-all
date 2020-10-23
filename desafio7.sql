-- Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, com a quantidade de seguidores que ela possui, de acordo com os detalhes a seguir.
-- Para tal, crie uma VIEW chamada perfil_artistas, com as seguintes colunas:
-- A primeira coluna deve exibir o nome da pessoa artista, com o alias "artista".
-- A segunda coluna deve exibir o nome do álbum, com o alias "album".
-- A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui e deve possuir o alias "seguidores".
-- Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras.
-- Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética e caso há artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.

CREATE VIEW perfil_artistas AS
SELECT art.artist_name AS 'artista',
alb.album_title AS 'album',
COUNT(fol.user_id) AS 'seguidores'
FROM SpotifyClone.artists AS art
INNER JOIN SpotifyClone.albums AS alb ON alb.artist_id = art.artist_id
INNER JOIN SpotifyClone.followers AS fol ON fol.artist_id = art.artist_id
GROUP BY alb.album_id
ORDER BY `seguidores` DESC, `artista`, `album`;
