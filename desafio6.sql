CREATE VIEW faturamento_atual AS
SELECT
MIN(p.plan_value) as 'faturamento_minimo',
MAX(p.plan_value)  as 'faturamento_maximo',
ROUND(AVG(p.plan_value), 2) as 'faturamento_medio',
ROUND(SUM(p.plan_value), 2) AS 'faturamento_total'
from SpotifyClone.plano as p, SpotifyClone.usuario as u
where u.plan_id = p.plan_id;
