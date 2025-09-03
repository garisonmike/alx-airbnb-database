\# Airbnb Clone – Database Schema



This folder contains the database setup for the Airbnb Clone project.  

It includes everything needed to create the database tables and set up the relationships between them.



\## What's Inside?

\- \*\*schema.sql\*\* – This is the main script. It creates all the tables (users, properties, bookings, reviews) and sets up the keys and constraints.

\- \*\*README.md\*\* – You're reading it 😊. Just a short guide to explain what this folder is about and how to use the SQL script.



\## About the Database

The database is designed to keep things simple but organized:

\- \*\*Users\*\* – Who is using the platform.

\- \*\*Properties\*\* – What places are being listed.

\- \*\*Bookings\*\* – Who booked what and when.

\- \*\*Reviews\*\* – Feedback left by users about the properties.



Each table is linked properly using foreign keys so data stays consistent.



\## How to Use

1\. Open your database tool (SQLite, MySQL, or PostgreSQL will all work with slight adjustments).

2\. Run the script:

&nbsp;  ```bash

&nbsp;  sqlite3 airbnb\_clone.db < schema.sql



