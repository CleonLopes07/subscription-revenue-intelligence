CREATE OR REPLACE VIEW mart.vw_monthly_active_users AS
SELECT
  billing_month::date AS billing_month,
  COUNT(DISTINCT cust_id) AS mau
FROM stg.fact_subscription
GROUP BY billing_month
ORDER BY billing_month;
