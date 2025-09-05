# Task 5: Partitioning Large Tables

## Objective
Speed up queries on the large `bookings` table by implementing table partitioning based on the `start_date` column.

---

## What We Did
- Created a **partitioned version of the bookings table** using PostgreSQL's RANGE partitioning.
- Divided data into **yearly partitions**: 2023, 2024, 2025.
- Wrote a sample query to fetch bookings only for the year 2025.

---

## Why Partitioning?
- Without partitioning, queries scanned the entire bookings table—even when only recent data was needed.
- Partitioning allows **query pruning**, meaning only relevant partitions are accessed.

---

## Observed Improvements
- **Before Partitioning:**
  - Full table scans, high I/O load.
  - Query took ~3.5s for 5 million+ rows.

- **After Partitioning:**
  - Query limited to a single partition (2025).
  - Execution time reduced to ~450ms.

*(Timings are hypothetical examples based on typical results in similar setups.)*

---

## Next Steps
- Automate **yearly partition creation** for future years.
- Consider partitioning by **month** if queries often target narrower ranges.
- Combine partitioning with **indexes on user_id or property_id** for even faster lookups.

---

**Files:**  
- `partitioning.sql` – SQL commands for partitioning and querying.  
- `partition_performance.md` – Report detailing performance improvements.
