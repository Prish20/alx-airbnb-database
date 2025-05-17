/*
    This script demonstrates the optimization of a complex query for retrieving booking information
    in an Airbnb-like database. It includes:

    1. The initial complex query that joins bookings, users, properties, and payments tables to fetch
       comprehensive booking details.
    2. An optimized version of the query that filters bookings to only those with a 'confirmed' status
       and orders the results by the booking start date in descending order.
    3. A performance analysis section using EXPLAIN ANALYZE to evaluate the execution plan and efficiency
       of the query after potential indexing improvements.

    Tables involved:
      - bookings: Contains booking records.
      - users: Contains user information.
      - properties: Contains property details.
      - payments: Contains payment transactions related to bookings.

    Optimization techniques highlighted:
      - Filtering with WHERE clause to reduce result set.
      - Ordering results for better usability.
      - Using EXPLAIN ANALYZE for performance diagnostics.
*/

-- Initial Complex Query
SELECT b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
       u.first_name, u.last_name, u.email,
       p.name AS property_name, p.location, p.pricepernight,
       py.amount, py.payment_date, py.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id AND b.status IS NOT NULL
JOIN properties p ON b.property_id = p.property_id AND p.location IS NOT NULL
LEFT JOIN payments py ON b.booking_id = py.booking_id;

-- Optimized Query
SELECT b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
       u.first_name, u.last_name, u.email,
       p.name AS property_name, p.location, p.pricepernight,
       py.amount, py.payment_date, py.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments py ON b.booking_id = py.booking_id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC;

-- Performance Check After Indexing
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
       u.first_name, u.last_name, u.email,
       p.name AS property_name, p.location, p.pricepernight,
       py.amount, py.payment_date, py.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments py ON b.booking_id = py.booking_id;
