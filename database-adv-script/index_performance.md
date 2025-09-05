# Task 3: Implement Indexes for Optimization

## Objective
To make our Airbnb database faster by creating indexes on frequently used columns in the **Users**, **Bookings**, and **Properties** tables.

---

## What We Did
- Added indexes on:
  - **Users**: `email`, `username`
  - **Bookings**: `user_id`, `property_id`, `start_date`
  - **Properties**: `location`, `host_id`

- These columns are often used in:
  - `WHERE` clauses (e.g., filtering by email, property location)
  - `JOIN` operations (linking users to bookings, properties to bookings)
  - `ORDER BY` or date-range filters.

---

## Why Indexes?
Indexes act like a **table of contents** for your database. Instead of scanning every row, the database can jump directly to the data it needs.

- **Before indexing:** Queries scanned the entire table → slow on large datasets.
- **After indexing:** Queries use indexes to fetch results faster → significant performance improvement.

---

## Performance Check
We used `EXPLAIN`/`ANALYZE` before and after creating indexes.  
Result: Queries involving user authentication, booking lookups, and property searches executed much faster (especially with large datasets).

---

## Next Steps
- Continuously monitor query performance as the database grows.
- Remove unused indexes (too many can slow down writes).
- Add composite indexes later if queries combine multiple columns frequently.

---

**File:** `database_index.sql`
