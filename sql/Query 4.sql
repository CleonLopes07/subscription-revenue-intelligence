CREATE TABLE IF NOT EXISTS dim.dim_date (
  date DATE PRIMARY KEY,
  year INTEGER,
  month INTEGER,
  month_start DATE,
  month_name TEXT,
  quarter INTEGER,
  is_month_end BOOLEAN
);

WITH bounds AS (
  SELECT MIN(transaction_date)::date AS min_dt, MAX(transaction_date)::date AS max_dt
  FROM stg.fact_subscription
)
INSERT INTO dim.dim_date (date, year, month, month_start, month_name, quarter, is_month_end)
SELECT d::date,
       EXTRACT(YEAR FROM d)::int,
       EXTRACT(MONTH FROM d)::int,
       date_trunc('month', d)::date,
       to_char(d, 'Mon YYYY'),
       EXTRACT(QUARTER FROM d)::int,
       (d = (date_trunc('month', d) + INTERVAL '1 month - 1 day')::date)
FROM bounds,
     generate_series(bounds.min_dt - INTERVAL '365 day',
                     bounds.max_dt + INTERVAL '365 day',
                     INTERVAL '1 day') g(d)
ON CONFLICT (date) DO NOTHING;

