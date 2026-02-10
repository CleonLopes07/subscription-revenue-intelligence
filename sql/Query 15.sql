CREATE OR REPLACE VIEW mart.vw_cohort_retention_long AS
WITH first_tx AS (
  SELECT 
    cust_id,
    date_trunc('month', MIN(transaction_date))::date AS cohort_month
  FROM stg.fact_subscription
  GROUP BY cust_id
),
active_months AS (
  SELECT 
    cust_id,
    date_trunc('month', transaction_date)::date AS active_month
  FROM stg.fact_subscription
),
cohort_base AS (
  SELECT 
    cust_id,
    cohort_month
  FROM first_tx
),
cohort_sizes AS (
  SELECT 
    cohort_month,
    COUNT(DISTINCT cust_id) AS cohort_size
  FROM cohort_base
  GROUP BY cohort_month
),
cohort_activity AS (
  SELECT 
    cb.cohort_month,
    am.active_month,
    COUNT(DISTINCT am.cust_id) AS active_users
  FROM cohort_base cb
  JOIN active_months am 
    ON cb.cust_id = am.cust_id
  GROUP BY cb.cohort_month, am.active_month
)
SELECT
  ca.cohort_month,
  ca.active_month,
  cs.cohort_size,
  ca.active_users,
  (
    (EXTRACT(YEAR  FROM ca.active_month) * 12 + EXTRACT(MONTH FROM ca.active_month)) -
    (EXTRACT(YEAR  FROM ca.cohort_month) * 12 + EXTRACT(MONTH FROM ca.cohort_month))
  )::int AS months_since,
  (ca.active_users::numeric / cs.cohort_size)::numeric(6,4) AS retention_rate
FROM cohort_activity ca
JOIN cohort_sizes cs USING (cohort_month)
ORDER BY ca.cohort_month, months_since;
