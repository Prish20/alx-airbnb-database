-- ========================================
-- Airbnb Database Schema
-- ========================================
-- This script defines the schema for the Airbnb-like database,
-- including tables, relationships, and indexing for optimization.
-- ========================================

-- ===========================
-- User Table
-- Stores basic user information including credentials and role.
-- Index: Email is indexed for faster lookups.
-- ===========================
CREATE TABLE users (
    user_id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL, -- Indexed for fast search
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(20) NOT NULL, -- ENUM ('guest', 'host', 'admin')
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index on email for fast user lookup
CREATE INDEX idx_user_email ON users(email);

-- ===========================
-- Property Table
-- Stores details of properties hosted by users.
-- Index: Host ID for quick retrieval of user properties.
-- ===========================
CREATE TABLE properties (
    property_id VARCHAR(36) PRIMARY KEY,
    host_id VARCHAR(36),
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id)
);

-- Index on host_id to speed up property searches by host
CREATE INDEX idx_property_host ON properties(host_id);

-- ===========================
-- Booking Table
-- Stores booking information, linking users to properties.
-- Indexes: Property ID and User ID for fast booking retrieval.
-- ===========================
CREATE TABLE bookings (
    booking_id VARCHAR(36) PRIMARY KEY,
    property_id VARCHAR(36),
    user_id VARCHAR(36),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL, -- ENUM ('pending', 'confirmed', 'canceled')
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Index on user_id to quickly retrieve user bookings
CREATE INDEX idx_booking_user ON bookings(user_id);

-- Index on property_id to efficiently find bookings by property
CREATE INDEX idx_booking_property ON bookings(property_id);

-- ===========================
-- Payment Table
-- Stores payment details linked to bookings.
-- Index: Booking ID to speed up payment verification.
-- ===========================
CREATE TABLE payments (
    payment_id VARCHAR(36) PRIMARY KEY,
    booking_id VARCHAR(36),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL, -- ENUM ('credit_card', 'paypal', 'stripe')
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Index on booking_id to optimize payment lookup
CREATE INDEX idx_payment_booking ON payments(booking_id);

-- ===========================
-- Review Table
-- Stores user reviews for properties.
-- Index: Property ID for fast review retrieval.
-- ===========================
CREATE TABLE reviews (
    review_id VARCHAR(36) PRIMARY KEY,
    property_id VARCHAR(36),
    user_id VARCHAR(36),
    rating INT CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Index on property_id to speed up property review searches
CREATE INDEX idx_review_property ON reviews(property_id);

-- ===========================
-- Message Table
-- Stores messages sent between users.
-- Indexes: Sender ID and Recipient ID for fast message lookup.
-- ===========================
CREATE TABLE messages (
    message_id VARCHAR(36) PRIMARY KEY,
    sender_id VARCHAR(36),
    recipient_id VARCHAR(36),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);

-- Index on sender_id to facilitate message retrieval by sender
CREATE INDEX idx_message_sender ON messages(sender_id);

-- Index on recipient_id for fast message access
CREATE INDEX idx_message_recipient ON messages(recipient_id);

-- ===========================
-- Summary:
-- The schema includes tables for users, properties, bookings,
-- payments, reviews, and messages. Indexes are created on fields
-- that are frequently queried to improve database performance.
-- ===========================
