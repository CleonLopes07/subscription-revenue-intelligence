CREATE OR REPLACE VIEW mart.vw_user_ltv AS
SELECT
  cust_id,
  SUM(subscription_price)::numeric(12,2) AS lifetime_revenue,
  MIN(transaction_date)::date AS first_tx,
  MAX(transaction_date)::date AS last_tx,
  COUNT(*) FILTER (
    WHERE transaction_type IN ('initial','renewal')
  ) AS paid_events
FROM stg.fact_subscription
GROUP BY cust_id;
