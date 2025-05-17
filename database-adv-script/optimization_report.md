# Complex Query Optimization Report

## Initial Query Analysis

- Execution Time: 0.189 ms
- Planning Time: 0.469 ms
- Query Cost: 3.75
- Issues:
  - Sequential Scans on users and payments tables.
  - Multiple Hash Joins causing intermediate processing.
  - No filtering before joining, leading to unnecessary data processing.

## Optimized Query Analysis

- Execution Time: 0.130 ms
- Planning Time: 0.379 ms
- Query Cost: 2.0
- Improvements:
  - Reduced Execution Time by 31%.
  - Reduced Planning Time by 19%.
  - Improved filtering by using `WHERE b.status = 'confirmed'`.
  - Reduced unnecessary joins, focusing only on confirmed bookings.
  - Better ordering by leveraging indexed columns.

## Conclusion

- Applying filters early significantly reduces data processing.
- Proper use of indexed columns for ordering improves query efficiency.
- Optimized joins minimize hash operations and intermediate calculations.
