CREATE TABLE IF NOT EXISTS dim.dim_customer AS
SELECT DISTINCT
  cust_id,
  customer_gender,
  age_group,
  customer_country,
  cohort_month,
  first_tx
FROM stg.fact_subscription
WHERE cust_id IS NOT NULL;

ALTER TABLE dim.dim_customer ADD PRIMARY KEY (cust_id);

CREATE TABLE IF NOT EXISTS dim.dim_plan AS
SELECT DISTINCT
  plan_id,
  subscription_type,
  MAX(subscription_price) AS canonical_price
FROM stg.fact_subscription
WHERE plan_id IS NOT NULL
GROUP BY plan_id, subscription_type;

ALTER TABLE dim.dim_plan ADD PRIMARY KEY (plan_id);

CREATE TABLE IF NOT EXISTS dim.dim_referral AS
SELECT DISTINCT referral_type
FROM stg.fact_subscription;

