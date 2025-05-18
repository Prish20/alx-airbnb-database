-- Enabling the pg_stat_statements extension
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- Check if the extension is active
SELECT * FROM pg_available_extensions WHERE name = 'pg_stat_statements';

-- View collected statistics
SELECT query, calls, total_time, rows, mean_time, stddev_time
FROM pg_stat_statements
ORDER BY total_time DESC
LIMIT 10;
