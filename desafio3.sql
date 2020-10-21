create view historico_reproducao_usuarios as
select usuario as usuario,
cancao as nome
from historico_de_reproducoes
inner join usuarios
on usuarios.usuarioId = historico_de_reproducoes.usuario_id
inner join cancoes
on cancoes.cancaoId = historico_de_reproducoes.cancao_id
order by usuario, cancao;
