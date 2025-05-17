
-- This script contains two SQL queries:
-- 1. Retrieves the names of properties along with their average review ratings,
--    filtering to include only those properties with an average rating greater than 4.0.
-- 2. Retrieves the first and last names of users who have made more than three bookings.
SELECT p.name, AVG(r.rating) AS average_rating
FROM properties p
JOIN reviews r ON p.property_id = r.property_id
GROUP BY p.name
HAVING AVG(r.rating) > 4.0;

SELECT u.first_name, u.last_name
FROM users u
WHERE (SELECT COUNT(*)
       FROM bookings b
       WHERE b.user_id = u.user_id) > 3;
