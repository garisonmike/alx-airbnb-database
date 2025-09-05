-- ALX Airbnb Database – Task 1: Subqueries
-- This script contains examples of both non-correlated and correlated subqueries.

-- 1. Non-correlated Subquery:
-- Find all properties where the average rating is greater than 4.0.
SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.price
FROM properties AS p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews AS r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- 2. Correlated Subquery:
-- Find all users who have made more than 3 bookings.
SELECT
    u.id AS user_id,
    u.name AS user_name,
    u.email
FROM users AS u
WHERE (
    SELECT COUNT(*)
    FROM bookings AS b
    WHERE b.user_id = u.id
) > 3;
