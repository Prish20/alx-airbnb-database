-- Monitoring database performance using pg_stat_statements

-- Enable the extension if not already active
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- View available extensions to check if pg_stat_statements is loaded
SELECT * FROM pg_available_extensions WHERE name = 'pg_stat_statements';

-- List the top 10 most time-consuming queries
SELECT query, calls, total_exec_time AS exec_time, rows, mean_exec_time AS mean_time, stddev_exec_time AS stddev_time
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 10;

-- Example of analyzing a specific query performance
EXPLAIN ANALYZE
SELECT u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;
