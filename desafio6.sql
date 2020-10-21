-- replace substitui uma string por uma nova string setada
-- fonte https://www.w3schools.com/sql/func_mysql_replace.asp

create view faturamento_atual as
select
ROUND(MIN(REPLACE(valor, ',','.')), 2) as faturamento_minimo,
MAX(REPLACE(valor, ',','.')) as faturamento_maximo,
ROUND(AVG(REPLACE(valor, ',','.')), 2) as faturamento_medio,
SUM(REPLACE(valor, ',', '.')) as faturamento_total
from usuarios
inner join planos
on usuarios.planoId = planos.planoId;
