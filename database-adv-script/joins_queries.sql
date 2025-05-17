-- This script demonstrates various SQL join operations to retrieve comprehensive data from an Airbnb-like database:
-- 1. Retrieves booking details along with the user's first and last name by joining the bookings and users tables on the user_id field.
-- 2. Retrieves property names and their associated reviews by performing a left join on the properties and reviews tables, ensuring all properties are listed even if they have no reviews.
-- 3. Retrieves user names and their associated booking details by performing a full outer join on the users and bookings tables, ensuring all users and bookings are included even if they don't match.
-- These queries provide insights into bookings, user information, property listings, and reviews for advanced data analysis.

SELECT b.booking_id, u.first_name, u.last_name, b.start_date, b.end_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;
-- This query retrieves booking details along with the user's first and last name
-- by joining the bookings and users tables on the user_id field.

SELECT p.name AS property_name, r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.name;
-- This query retrieves property names and their associated reviews
-- by performing a left join on the properties and reviews tables.
-- It ensures that all properties are listed, even if they have no reviews.
-- This is useful for getting a complete list of properties with their reviews.

SELECT u.first_name, u.last_name, b.booking_id, b.start_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
-- This query retrieves user names and their associated booking details
-- by performing a full outer join on the users and bookings tables.
-- It ensures that all users and bookings are included, even if they don't match.
-- This is useful for getting a comprehensive view of users and their bookings.
-- Note: The actual table and column names may vary based on your database schema.
