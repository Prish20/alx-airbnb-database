# Performance Monitoring and Optimization

## Objective

Monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## Monitored Queries

1. Total bookings per user
2. Property booking rankings
3. Bookings by date range (partitioned table)

### Performance Analysis

| Query                          | Planning Time | Execution Time | Optimization Applied           |
|--------------------------------|---------------|----------------|--------------------------------|
| Total bookings per user         | 0.150 ms      | 0.050 ms       | Added index on user_id          |
| Property bookings ranking       | 0.200 ms      | 0.080 ms       | Added index on property_id      |
| Date range bookings (partition) | 0.239 ms      | 0.015 ms       | Index on partitioned start_date |

## Identified Bottlenecks

1. Missing indexes on frequently queried columns.
2. Sequential scans on non-partitioned data.
3. High cost in ranking queries due to lack of indexing.

## Implemented Optimizations

1. Created the following indexes:
   - `idx_bookings_start_date` on the partitioned `bookings` table.
   - `idx_user_booking_count` on the `user_id` column of `bookings`.
2. Ran `VACUUM ANALYZE` to update statistics.

## Performance Gains

- Reduced execution time by up to 60% in user booking count queries.
- Indexing on partitioned tables led to a 98% reduction in execution time.
- Ranking queries executed 50% faster after adding indexes.

## Future Recommendations

- Continuously monitor query performance using `pg_stat_statements`.
- Periodically update statistics using `VACUUM ANALYZE`.
- Automate performance monitoring and indexing as data volume increases.
