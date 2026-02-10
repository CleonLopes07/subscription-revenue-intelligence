CREATE TABLE IF NOT EXISTS mart.fact_subscription_periods AS
SELECT
  cust_id,
  billing_month,
  MAX(plan_id) AS plan_id,
  COUNT(*) FILTER (WHERE transaction_type IN ('initial','renewal')) AS revenue_events,
  SUM(
    CASE 
      WHEN transaction_type IN ('initial','renewal') 
      THEN subscription_price 
      ELSE 0 
    END
  )::numeric(12,2) AS revenue,
  BOOL_OR(transaction_type = 'cancellation') AS cancelled_flag  -- <== FIXED
FROM stg.fact_subscription
GROUP BY cust_id, billing_month;
