CREATE OR REPLACE VIEW mart.vw_revenue_by_plan_country_referral AS
SELECT
  billing_month::date AS billing_month,
  subscription_type,
  customer_country,
  referral_type,
  SUM(
    CASE 
      WHEN transaction_type IN ('initial','renewal') 
      THEN subscription_price 
      ELSE 0 
    END
  )::numeric(12,2) AS revenue,
  COUNT(DISTINCT cust_id) AS customers
FROM stg.fact_subscription
GROUP BY billing_month, subscription_type, customer_country, referral_type
ORDER BY billing_month, subscription_type, customer_country, referral_type;
