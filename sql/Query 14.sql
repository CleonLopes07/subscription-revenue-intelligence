CREATE OR REPLACE VIEW mart.vw_monthly_churn AS
WITH cancellations AS (
  SELECT 
    billing_month::date AS billing_month, 
    COUNT(DISTINCT cust_id) AS cancellations
  FROM stg.fact_subscription
  WHERE transaction_type = 'cancellation'
  GROUP BY billing_month
),
active AS (
  SELECT 
    billing_month::date AS billing_month, 
    COUNT(DISTINCT cust_id) AS active_users
  FROM stg.fact_subscription
  GROUP BY billing_month
)
SELECT 
  a.billing_month,
  a.active_users,
  COALESCE(c.cancellations, 0) AS cancellations,
  CASE 
    WHEN a.active_users = 0 THEN 0
    ELSE (COALESCE(c.cancellations, 0)::numeric / a.active_users)::numeric(12,4)
  END AS churn_rate
FROM active a
LEFT JOIN cancellations c USING (billing_month)
ORDER BY a.billing_month;
