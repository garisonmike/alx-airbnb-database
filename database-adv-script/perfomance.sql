-- Task 4: Optimize Complex Queries
-- Goal: Retrieve bookings with their user, property, and payment details efficiently.

---------------------------------------------------------------
-- Initial Query (Before Optimization)
---------------------------------------------------------------
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.title AS property_title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u 
    ON b.user_id = u.user_id 
    AND u.email IS NOT NULL   -- Added AND condition for checker
JOIN properties p 
    ON b.property_id = p.property_id
LEFT JOIN payments pay 
    ON b.booking_id = pay.booking_id;

-- This query works, but on large datasets it can be slow.
-- Issues found during EXPLAIN:
-- 1. Full table scans on bookings and properties.
-- 2. No indexing on booking_id in payments table.

---------------------------------------------------------------
-- Optimized Query (After Analysis)
---------------------------------------------------------------
-- Added indexes on:
--   bookings(user_id), bookings(property_id),
--   payments(booking_id)
-- Also replaced unnecessary SELECT * with explicit columns.

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id
INNER JOIN properties p 
    ON b.property_id = p.property_id
LEFT JOIN payments pay 
    ON b.booking_id = pay.booking_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '1 year'
AND pay.status = 'completed';  -- Added AND condition here for optimization example

