CREATE VIEW faturamento_atual AS
SELECT
  ROUND(MIN(subscription_price), 2) AS 'faturamento_minimo',
  ROUND(MAX(subscription_price), 2) AS 'faturamento_maximo',
  ROUND(AVG(subscription_price), 2) AS 'faturamento_medio',
  ROUND(SUM(subscription_price), 2) AS 'faturamento_total'
FROM
  SpotifyClone.subscription
JOIN
  SpotifyClone.users
ON
  users.subscription_id = subscription.subscription_id;
