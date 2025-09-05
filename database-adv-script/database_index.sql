-- Task 3: Implement Indexes for Optimization
-- Goal: Improve query performance on frequently used columns in User, Booking, and Property tables.

---------------------------------------------------------------
-- 1) Indexes on the Users table
-- Common use: Searching users by email or username during login/authentication.
---------------------------------------------------------------
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);

---------------------------------------------------------------
-- 2) Indexes on the Bookings table
-- Common use: Filtering by user_id, property_id, or booking dates.
---------------------------------------------------------------
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

---------------------------------------------------------------
-- 3) Indexes on the Properties table
-- Common use: Searching properties by location or host_id.
---------------------------------------------------------------
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- After creating these indexes, you should run EXPLAIN or ANALYZE
-- on your most-used queries to confirm performance improvements.
-- Indexes help the database skip full table scans and jump directly
-- to the needed rows.
