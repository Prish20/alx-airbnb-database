-- ========================================
-- Indexing for Performance Optimization
-- ========================================

-- User Table: Index on email for fast lookup
DROP INDEX IF EXISTS idx_user_email;
CREATE INDEX idx_user_email ON users(email);

-- Booking Table: Index on user_id for quick user booking retrieval
DROP INDEX IF EXISTS idx_booking_user_id;
CREATE INDEX idx_booking_user_id ON bookings(user_id);

-- Booking Table: Index on property_id to speed up property-booking joins
DROP INDEX IF EXISTS idx_booking_property_id;
CREATE INDEX idx_booking_property_id ON bookings(property_id);

-- Booking Table: Index on start_date to optimize date-based searches
DROP INDEX IF EXISTS idx_booking_start_date;
CREATE INDEX idx_booking_start_date ON bookings(start_date);

-- Property Table: Index on host_id to efficiently find properties by host
DROP INDEX IF EXISTS idx_property_host_id;
CREATE INDEX idx_property_host_id ON properties(host_id);

-- Property Table: Index on location for geographic filtering
DROP INDEX IF EXISTS idx_property_location;
CREATE INDEX idx_property_location ON properties(location);

-- Property Table: Index on pricepernight for sorting and filtering
DROP INDEX IF EXISTS idx_property_price;
CREATE INDEX idx_property_price ON properties(pricepernight);

-- ========================================
-- Measuring Performance Before and After Indexing
-- ========================================

-- To analyze performance, use EXPLAIN or your database's query plan tool before and after running the above index statements.
-- Example for PostgreSQL:
-- EXPLAIN ANALYZE
-- Performance Check Before Indexing
EXPLAIN ANALYZE
SELECT u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

-- Performance Check After Indexing
EXPLAIN ANALYZE
SELECT u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;
