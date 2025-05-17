/*
    This script demonstrates the use of aggregation and window functions in SQL for an Airbnb-like database.

    1. Aggregation: Calculates the total number of bookings made by each user.
       - Joins the 'users' and 'bookings' tables on 'user_id'.
       - Uses COUNT to aggregate the number of bookings per user.
       - Groups results by user details.

    2. Window Function: Ranks properties based on the total number of bookings.
       - Joins the 'properties' and 'bookings' tables on 'property_id'.
       - Aggregates the total bookings per property.
       - Uses the RANK() window function to assign a rank to each property based on booking count in descending order.
       - Orders the final result by rank.
*/
-- Aggregation: Total Number of Bookings Made by Each User
SELECT u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

-- Window Function: Rank Properties Based on Total Bookings
SELECT p.name AS property_name, COUNT(b.booking_id) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY rank;
