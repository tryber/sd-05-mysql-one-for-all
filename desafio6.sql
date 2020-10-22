create view faturamento_atual as 
select 
ROUND(MIN(valor), 2) as faturamento_minimo,
ROUND(MAX(valor), 2) as faturamento_maximo,
ROUND(AVG(valor), 2) as faturamento_medio,
ROUND(SUM(valor), 2) as faturamento_total
from usuarios
inner join planos
on usuarios.planoId = planos.planoId;
