CREATE INDEX IF NOT EXISTS idx_fact_sub_periods_billing_month
  ON mart.fact_subscription_periods (billing_month);

CREATE INDEX IF NOT EXISTS idx_fact_payments_cust_id
  ON mart.fact_payments (cust_id);

CREATE INDEX IF NOT EXISTS idx_stg_fact_subscription_tx_date
  ON stg.fact_subscription (transaction_date);
