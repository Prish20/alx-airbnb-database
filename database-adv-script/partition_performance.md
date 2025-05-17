# Partitioning Performance Report

## Objective

Optimize the performance of large booking queries by partitioning the `bookings` table based on the `start_date`.

## Initial Performance (Before Partitioning)

- Execution Time: 80 ms
- Planning Time: 5 ms
- Issue:
  - Sequential scans on the entire bookings table.
  - Slow performance when querying date ranges.

## Improved Performance (After Partitioning)

- Execution Time: 0.015 ms
- Planning Time: 0.239 ms
- Cost: 0.14 to 8.16
- Query Plan:
  - Uses **Index Scan** on the partition `bookings_2025` using `idx_bookings_2025_start_date`.
  - The index condition efficiently filters dates between `2025-06-01` and `2025-12-31`.

## Conclusion

- Partitioning significantly reduced execution time from ~80 ms to ~0.015 ms.
- Index utilization enhanced query performance by targeting specific partitions.
- The overall performance improvement is about **99.98%**.
- Recommended to continue partitioning for each new year as data grows.
