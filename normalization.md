\# AirBnB Database Normalization



\## Objective

To normalize the AirBnB database design to Third Normal Form (3NF) to prevent data redundancy and maintain data integrity.



\## Steps Taken



\### First Normal Form (1NF)

\- All attributes are atomic (no repeating or multi-valued groups).

\- Each table has a primary key (`user\_id`, `property\_id`, `booking\_id`, etc.).



\### Second Normal Form (2NF)

\- All non-key attributes are fully dependent on the primary key.

\- Since each table uses a single-column primary key (UUID), there are no partial dependencies.



\### Third Normal Form (3NF)

\- There are no transitive dependencies (no non-key attribute is dependent on another non-key attribute).

\- Each attribute is directly dependent on the primary key.



\## Conclusion

The database schema is already in 3NF and does not require further structural modifications. This offers:

\- Minimum redundancy.

\- Improved data integrity.

\- Easier maintenance and scalability.



