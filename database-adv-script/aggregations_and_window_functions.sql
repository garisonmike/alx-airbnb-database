-- Task 2: Apply Aggregations and Window Functions
-- In this task, we want to analyze bookings and rank properties.

---------------------------------------------------------------
-- 1) How many bookings has each user made?
-- We count all bookings per user and include users even if they made none.
---------------------------------------------------------------
SELECT 
    u.id AS user_id,        -- Unique ID of the user
    u.name AS user_name,    -- User's name for easy reading
    COUNT(b.id) AS total_bookings -- Total bookings linked to this user
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id   -- Include users even with no bookings
GROUP BY u.id, u.name;                     -- Group by user to get their totals

---------------------------------------------------------------
-- 2) Which properties are most popular?
-- We rank properties based on the number of bookings they have.
---------------------------------------------------------------
SELECT
    p.id AS property_id,           -- Property identifier
    p.title AS property_name,      -- Property name/title
    COUNT(b.id) AS total_bookings, -- Total number of times this property was booked
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank -- Rank: 1 = most booked
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id -- Include properties even if no bookings
GROUP BY p.id, p.title;                      -- Group per property
