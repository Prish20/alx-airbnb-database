-- ========================================
-- Airbnb Database Seed Script (10 Entries for Each Table)
-- ========================================

-- ===========================
-- Users (10 entries)
-- ===========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('uuid-101', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_101', '1234567890', 'guest'),
('uuid-102', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_102', '0987654321', 'guest'),
('uuid-103', 'Bob', 'Brown', 'bob.brown@example.com', 'hashed_password_103', '1231231234', 'host'),
('uuid-104', 'Eve', 'White', 'eve.white@example.com', 'hashed_password_104', '3213213214', 'host'),
('uuid-105', 'Admin', 'User', 'admin@airbnb.com', 'hashed_password_105', '5555555555', 'admin'),
('uuid-106', 'Charlie', 'Day', 'charlie.day@example.com', 'hashed_password_106', '1111111111', 'guest'),
('uuid-107', 'Diana', 'Prince', 'diana.prince@example.com', 'hashed_password_107', '2222222222', 'host'),
('uuid-108', 'Elon', 'Musk', 'elon.musk@example.com', 'hashed_password_108', '3333333333', 'guest'),
('uuid-109', 'Grace', 'Hopper', 'grace.hopper@example.com', 'hashed_password_109', '4444444444', 'host'),
('uuid-110', 'Ada', 'Lovelace', 'ada.lovelace@example.com', 'hashed_password_110', '5555555555', 'admin');

-- ===========================
-- Properties (10 entries)
-- ===========================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('prop-101', 'uuid-103', 'Cozy Cottage', 'Comfortable cottage with garden', 'New York', 120.00),
('prop-102', 'uuid-103', 'Skyline Apartment', 'Modern city apartment with view', 'Chicago', 200.00),
('prop-103', 'uuid-104', 'Mansion Suite', 'Luxury mansion with private pool', 'Gotham', 500.00),
('prop-104', 'uuid-104', 'Iron Penthouse', 'High-tech penthouse in Malibu', 'Malibu', 800.00),
('prop-105', 'uuid-107', 'Amazonian Retreat', 'Cabin in the woods', 'Themyscira', 220.00),
('prop-106', 'uuid-109', 'Lake View Villa', 'Spacious villa near the lake', 'Seattle', 320.00),
('prop-107', 'uuid-107', 'Mountain Cabin', 'Rustic cabin with mountain views', 'Denver', 180.00),
('prop-108', 'uuid-109', 'Luxury Loft', 'Stylish loft in downtown', 'San Francisco', 400.00),
('prop-109', 'uuid-103', 'Beach House', 'Seaside house with private beach', 'Miami', 300.00),
('prop-110', 'uuid-104', 'Historic Inn', 'Vintage inn with charming decor', 'Boston', 150.00);

-- ===========================
-- Bookings (10 entries)
-- ===========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('book-101', 'prop-101', 'uuid-101', '2025-06-01', '2025-06-05', 600.00, 'confirmed'),
('book-102', 'prop-102', 'uuid-102', '2025-07-10', '2025-07-15', 750.00, 'pending'),
('book-103', 'prop-103', 'uuid-103', '2025-08-20', '2025-08-25', 1000.00, 'canceled'),
('book-104', 'prop-104', 'uuid-104', '2025-09-01', '2025-09-03', 200.00, 'confirmed'),
('book-105', 'prop-105', 'uuid-106', '2025-10-01', '2025-10-05', 1000.00, 'confirmed'),
('book-106', 'prop-106', 'uuid-108', '2025-11-01', '2025-11-07', 1200.00, 'pending'),
('book-107', 'prop-107', 'uuid-108', '2025-12-01', '2025-12-05', 700.00, 'canceled'),
('book-108', 'prop-108', 'uuid-109', '2025-12-10', '2025-12-15', 800.00, 'confirmed'),
('book-109', 'prop-109', 'uuid-106', '2026-01-01', '2026-01-03', 900.00, 'confirmed'),
('book-110', 'prop-110', 'uuid-110', '2026-01-05', '2026-01-08', 1050.00, 'confirmed');

-- ===========================
-- Payments (10 entries)
-- ===========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('pay-101', 'book-101', 600.00, 'credit_card'),
('pay-102', 'book-102', 750.00, 'paypal'),
('pay-103', 'book-103', 1000.00, 'stripe'),
('pay-104', 'book-104', 200.00, 'credit_card'),
('pay-105', 'book-105', 1000.00, 'paypal'),
('pay-106', 'book-106', 1200.00, 'stripe'),
('pay-107', 'book-107', 700.00, 'credit_card'),
('pay-108', 'book-108', 800.00, 'paypal'),
('pay-109', 'book-109', 900.00, 'stripe'),
('pay-110', 'book-110', 1050.00, 'credit_card');

-- ===========================
-- Reviews (10 entries)
-- ===========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('rev-101', 'prop-101', 'uuid-101', 5, 'Amazing experience, highly recommend!'),
('rev-102', 'prop-102', 'uuid-102', 4, 'Great location, comfortable stay.'),
('rev-103', 'prop-103', 'uuid-103', 3, 'Decent but could be cleaner.'),
('rev-104', 'prop-104', 'uuid-104', 5, 'Perfect family getaway.'),
('rev-105', 'prop-105', 'uuid-105', 4, 'Stylish and modern, loved it.');

-- ===========================
-- Messages (10 entries)
-- ===========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('msg-101', 'uuid-101', 'uuid-103', 'Is the cottage available for next week?'),
('msg-102', 'uuid-103', 'uuid-101', 'Yes, it is available.'),
('msg-103', 'uuid-102', 'uuid-104', 'Can I book the mansion for July?'),
('msg-104', 'uuid-104', 'uuid-102', 'Sure, I will block the dates for you.');
