-- ========================================
-- Step 1: Drop the existing partitioned table if any
-- ========================================
DROP TABLE IF EXISTS bookings_partitioned CASCADE;

-- ========================================
-- Step 2: Create the parent partitioned table
-- ========================================
CREATE TABLE bookings_partitioned (
    booking_id VARCHAR(36),
    property_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
) PARTITION BY RANGE (start_date);

-- ========================================
-- Step 3: Create partitions based on year
-- ========================================
CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_2026 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- ========================================
-- Step 4: Add indexes to each partition
-- ========================================
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025 (start_date);
CREATE INDEX idx_bookings_2026_start_date ON bookings_2026 (start_date);

-- ========================================
-- Step 5: Migrate existing data from the original bookings table
-- ========================================
INSERT INTO bookings_partitioned (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM bookings;

-- ========================================
-- Step 6: Performance Test on Partitioned Table
-- ========================================
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2025-06-01' AND '2025-12-31';
