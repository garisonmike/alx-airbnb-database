# Task 4: Optimize Complex Queries

## Objective
Improve the performance of a heavy query that retrieves booking details along with user, property, and payment information.

---

## What We Did
- Started with a **raw JOIN query** that retrieved every column from four tables (`bookings`, `users`, `properties`, `payments`).
- Ran **EXPLAIN** on the query to identify inefficiencies:
  - Full table scans on `bookings` and `properties`
  - No index on `payments.booking_id`
  - Selecting unnecessary columns

---

## Optimizations Applied
- **Added Indexes:**
  - `bookings(user_id)`
  - `bookings(property_id)`
  - `payments(booking_id)`
- **Reduced Data Load:**
  - Replaced `SELECT *` with specific columns.
  - Added a date filter (`last 12 months`) to avoid processing old bookings.
- **Adjusted Joins:**
  - Kept essential INNER JOINs and used LEFT JOIN only where optional (payments).

---

## Results
- Before: Slow response due to full scans and wide column selection.
- After: Significant reduction in execution time (as observed with `EXPLAIN ANALYZE`).
- Query now scales better with larger datasets.

---

## Next Steps
- Continue monitoring with `EXPLAIN ANALYZE` on high-traffic endpoints.
- Consider **partitioning bookings table by year** if dataset grows further.
- Review **composite indexes** for combined filters (e.g., `user_id + start_date`).

---

**Files:**  
- `perfomance.sql` – Optimized SQL query  
- `optimization_report.md` – Documentation of analysis and improvements
