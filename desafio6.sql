CREATE VIEW faturamento_atual AS 
SELECT min(plan.valor_plano) as faturamento_minimo,
max(plan.valor_plano) as faturamento_maximo,
round(avg(plan.valor_plano), 2) as faturamento_medio,
sum(plan.valor_plano) as faturamento_total
FROM SpotifyClone.Usuário as usr
JOIN SpotifyClone.Plano as plan
ON plan.plano_id = usr.plano_id;
