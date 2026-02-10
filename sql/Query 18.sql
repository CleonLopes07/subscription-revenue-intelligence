CREATE OR REPLACE VIEW mart.vw_funnel AS
SELECT
  billing_month::date AS billing_month,
  COUNT(DISTINCT CASE WHEN transaction_type = 'initial'      THEN cust_id END) AS initial_count,
  COUNT(DISTINCT CASE WHEN transaction_type = 'renewal'      THEN cust_id END) AS renewal_count,
  COUNT(DISTINCT CASE WHEN transaction_type = 'cancellation' THEN cust_id END) AS cancellation_count
FROM stg.fact_subscription
GROUP BY billing_month
ORDER BY billing_month;
