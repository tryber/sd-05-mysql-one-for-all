create view top_2_hits_do_momento as
select cancao,
count(cancao_id) as reproducoes from historico_de_reproducoes
inner join cancoes
on historico_de_reproducoes.cancao_id = cancoes.cancaoId
group by cancao
ORDER BY reproducoes desc, cancao
LIMIT 2;
