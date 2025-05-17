-- User Table: Index on email for fast lookup
CREATE INDEX idx_user_email ON users(email);

-- Booking Table: Index on user_id for quick user booking retrieval
CREATE INDEX idx_booking_user_id ON bookings(user_id);

-- Booking Table: Index on property_id to speed up property-booking joins
CREATE INDEX idx_booking_property_id ON bookings(property_id);

-- Booking Table: Index on start_date to optimize date-based searches
CREATE INDEX idx_booking_start_date ON bookings(start_date);

-- Property Table: Index on host_id to efficiently find properties by host
CREATE INDEX idx_property_host_id ON properties(host_id);

-- Property Table: Index on location for geographic filtering
CREATE INDEX idx_property_location ON properties(location);

-- Property Table: Index on pricepernight for sorting and filtering
CREATE INDEX idx_property_price ON properties(pricepernight);


-- Dropping User Table Indexes
DROP INDEX IF EXISTS idx_user_email;

-- Dropping Booking Table Indexes
DROP INDEX IF EXISTS idx_booking_user_id;
DROP INDEX IF EXISTS idx_booking_property_id;
DROP INDEX IF EXISTS idx_booking_start_date;

-- Dropping Property Table Indexes
DROP INDEX IF EXISTS idx_property_host_id;
DROP INDEX IF EXISTS idx_property_location;
DROP INDEX IF EXISTS idx_property_price;
