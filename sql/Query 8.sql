CREATE TABLE IF NOT EXISTS mart.fact_payments AS
SELECT
  row_number() OVER () AS payment_id,
  cust_id,
  transaction_type,
  transaction_date,
  billing_month,
  subscription_price::numeric(10,2) AS amount,
  plan_id,
  referral_type
FROM stg.fact_subscription
WHERE transaction_type IN ('initial','renewal');

ALTER TABLE mart.fact_payments ADD PRIMARY KEY (payment_id);
