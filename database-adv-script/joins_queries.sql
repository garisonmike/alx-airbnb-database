-- ALX Airbnb Database – Task 0: Complex Queries with Joins
-- This script demonstrates three types of joins (INNER, LEFT, FULL OUTER)
-- using the Airbnb schema with tables: users, bookings, properties, and reviews.

-- 1. INNER JOIN: Get all bookings with the respective users who made them.
-- Only users who have made bookings will appear.
SELECT
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM bookings AS b
INNER JOIN users AS u ON b.user_id = u.id;

-- 2. LEFT JOIN: Get all properties and their reviews.
-- Properties with no reviews will still appear, with NULL for review details.
SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.price,
    r.id AS review_id,
    r.rating,
    r.comment
FROM properties AS p
LEFT JOIN reviews AS r ON p.id = r.property_id
ORDER BY p.id;


-- 3. FULL OUTER JOIN: Get all users and all bookings.
-- This includes users with no bookings and bookings without a linked user.
-- MySQL doesn't support FULL OUTER JOIN natively, so we use UNION of LEFT + RIGHT JOIN.
SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM users AS u
LEFT JOIN bookings AS b ON u.id = b.user_id
UNION
SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM users AS u
RIGHT JOIN bookings AS b ON u.id = b.user_id;
