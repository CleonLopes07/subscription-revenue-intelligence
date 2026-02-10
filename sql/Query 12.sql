CREATE OR REPLACE VIEW mart.vw_mrr_by_month AS
SELECT
  billing_month::date AS billing_month,
  SUM(revenue)::numeric(12,2) AS mrr,
  (SUM(revenue) * 12)::numeric(14,2) AS arr,
  COUNT(DISTINCT cust_id) AS active_subscribers,
  CASE 
    WHEN COUNT(DISTINCT cust_id) = 0 THEN 0
    ELSE (SUM(revenue) / COUNT(DISTINCT cust_id))::numeric(12,2)
  END AS arpu
FROM mart.fact_subscription_periods
GROUP BY billing_month
ORDER BY billing_month;
