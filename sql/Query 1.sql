CREATE SCHEMA IF NOT EXISTS stg;
CREATE SCHEMA IF NOT EXISTS dim;
CREATE SCHEMA IF NOT EXISTS mart;
CREATE SCHEMA IF NOT EXISTS monitoring;

CREATE TABLE IF NOT EXISTS stg.fact_subscription (
  cust_id BIGINT,
  transaction_type TEXT,
  transaction_date DATE,
  subscription_type TEXT,
  subscription_price NUMERIC(10,2),
  customer_gender TEXT,
  age_group TEXT,
  customer_country TEXT,
  referral_type TEXT,
  year INTEGER,
  month TEXT,
  first_tx DATE,
  cohort_month TEXT,
  plan_id INTEGER,
  billing_month DATE,
  is_churn BOOLEAN,
  active_month TEXT
);


