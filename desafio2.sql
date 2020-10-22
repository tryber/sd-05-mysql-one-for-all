-- primeira tentativa usando join não aprovada no teste
-- segunda tentativa feita setando importações específicas, setando tabela e coluna
-- a ser importada, idéia do repositório da julliete https://github.com/tryber/sd-05-mysql-one-for-all/tree/juliette-mysql-oneforall

create view estatisticas_musicais as
SELECT count(DISTINCT cancoes.cancao) as cancoes,
count(DISTINCT artistas.artistaId) as artistas,
count(DISTINCT albuns.album) as albuns from cancoes, artistas, albuns;
