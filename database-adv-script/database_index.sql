-- Task 3: Implement Indexes for Optimization
-- We will check performance before and after indexing using EXPLAIN ANALYZE.

---------------------------------------------------------------
-- BEFORE INDEXING: Check the performance of a sample query
---------------------------------------------------------------
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 1;

---------------------------------------------------------------
-- CREATE INDEXES
---------------------------------------------------------------
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_host_id ON properties(host_id);

---------------------------------------------------------------
-- AFTER INDEXING: Run the same query again to measure improvement
---------------------------------------------------------------
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 1;
