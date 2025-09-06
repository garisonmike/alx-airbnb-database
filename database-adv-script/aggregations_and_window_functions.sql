-- Task 2: Apply Aggregations and Window Functions
-- Human-friendly, robust approach: aggregate first, then apply window functions.

---------------------------------------------------------------
-- 1) How many bookings has each user made?
-- (unchanged - keep this block if it's already in your file)
---------------------------------------------------------------
SELECT 
    u.id AS user_id,        
    u.name AS user_name,    
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

---------------------------------------------------------------
-- 2) Which properties are most popular?
-- Aggregate first, then use ROW_NUMBER() and RANK() on the aggregated result.
---------------------------------------------------------------
SELECT
    property_id,
    property_name,
    total_bookings,
    -- ROW_NUMBER gives a unique sequential number (1,2,3,...)
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC)  AS row_number_rank,
    -- RANK gives the same rank for ties (1,1,3,...)
    RANK()      OVER (ORDER BY total_bookings DESC)  AS rank_with_ties
FROM (
    SELECT
        p.id    AS property_id,
        p.title AS property_name,
        COUNT(b.id) AS total_bookings
    FROM properties p
    LEFT JOIN bookings b ON p.id = b.property_id
    GROUP BY p.id, p.title
) AS prop_counts
ORDER BY total_bookings DESC;

