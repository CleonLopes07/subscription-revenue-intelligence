SELECT COUNT(*) FROM stg.fact_subscription;
SELECT MIN(transaction_date), MAX(transaction_date) FROM stg.fact_subscription;
SELECT * FROM stg.fact_subscription LIMIT 5;