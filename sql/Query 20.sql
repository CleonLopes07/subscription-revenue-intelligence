CREATE TABLE IF NOT EXISTS monitoring.data_quality_checks (
  check_name TEXT PRIMARY KEY,
  check_value TEXT,
  status TEXT,
  run_ts TIMESTAMP DEFAULT now()
);

INSERT INTO monitoring.data_quality_checks (check_name, check_value, status)
VALUES (
  'stg_fact_subscription_rowcount',
  (SELECT COUNT(*)::text FROM stg.fact_subscription),
  'ok'
)
ON CONFLICT (check_name) DO UPDATE
SET check_value = EXCLUDED.check_value,
    status      = EXCLUDED.status,
    run_ts      = now();
