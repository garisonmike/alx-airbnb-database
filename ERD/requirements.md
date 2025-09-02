ERD Documentation



This diagram represents the database design for the ALX Airbnb project.



Entities

\- \*\*User\*\*: id, name, email, password, created\_at

\- \*\*Property\*\*: id, owner\_id, name, location, price, created\_at

\- \*\*Booking\*\*: id, user\_id, property\_id, start\_date, end\_date, status

\- \*\*Review\*\*: id, user\_id, property\_id, rating, comment, created\_at



Relationships

\- A \*\*User\*\* can own many \*\*Properties\*\*

\- A \*\*User\*\* can make many \*\*Bookings\*\*

\- A \*\*Property\*\* can have many \*\*Bookings\*\*

\- A \*\*Property\*\* can have many \*\*Reviews\*\*

\- A \*\*User\*\* can write many \*\*Reviews\*\*



