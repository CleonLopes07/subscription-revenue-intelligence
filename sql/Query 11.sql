-- Totals reconciliation
SELECT SUM(amount) AS total_payments FROM mart.fact_payments;

SELECT SUM(revenue) AS total_periods FROM mart.fact_subscription_periods;

SELECT SUM(subscription_price)::numeric(12,2) AS total_source
FROM stg.fact_subscription
WHERE transaction_type IN ('initial','renewal');

