# ALX Airbnb Database – Advanced Querying

This repository contains advanced SQL queries and optimizations for a simulated Airbnb database.  
The tasks focus on mastering **joins, subqueries, aggregations, and window functions**.

---

## Task 0: Write Complex Queries with Joins

### What we did
- Retrieved bookings and their users using an `INNER JOIN`.
- Retrieved all properties with their reviews using a `LEFT JOIN` (including those with no reviews).
- Retrieved all users and bookings using a `FULL OUTER JOIN` (even if some users have no bookings or some bookings have no linked user).

**File:** `joins_queries.sql`

---

## Task 1: Practice Subqueries

### What we did
- Found all properties where the **average rating is greater than 4.0** using a subquery.
- Used a **correlated subquery** to find users who have made more than **3 bookings**.

**File:** `subqueries.sql`

---

## Task 2: Apply Aggregations and Window Functions

### What we did
- Counted the total number of bookings made by each user using `COUNT()` and `GROUP BY`.
- Ranked properties based on total bookings using a `RANK()` window function.

**File:** `aggregations_and_window_functions.sql`

---

## How to Use
1. Clone this repository.
2. Load the SQL files into your database environment (e.g., MySQL, PostgreSQL).
3. Execute each file to see results for the corresponding task.

---

## Author
Project done by Mike as part of the **ALX Airbnb Database Advanced Module**.
