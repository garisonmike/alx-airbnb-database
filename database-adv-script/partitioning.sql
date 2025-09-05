-- Task 5: Partitioning Large Tables
-- Goal: Improve Booking table query performance using table partitioning.

---------------------------------------------------------------
-- Step 1: Create a Partitioned Table (by start_date - yearly)
---------------------------------------------------------------
-- Assuming we already have a large 'bookings' table.
-- We'll create a new partitioned version for optimization.

CREATE TABLE bookings_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    amount NUMERIC(10,2)
)
PARTITION BY RANGE (start_date);

-- Create yearly partitions
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

---------------------------------------------------------------
-- Step 2: Query Against Partitioned Table
---------------------------------------------------------------
-- Fetch bookings for 2025 to test partition pruning.

EXPLAIN ANALYZE
SELECT booking_id, user_id, property_id, start_date, amount
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Expected: Only the 'bookings_2025' partition should be scanned,
-- resulting in faster query execution.

