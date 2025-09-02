-- Users
INSERT INTO users (name, email, password) VALUES
('John Doe', 'john@example.com', 'hashedpassword1'),
('Jane Smith', 'jane@example.com', 'hashedpassword2');

-- Properties
INSERT INTO properties (owner_id, name, location, price) VALUES
(1, 'Cozy Apartment', 'Nairobi', 50.00),
(2, 'Luxury Villa', 'Mombasa', 120.00);

-- Bookings
INSERT INTO bookings (user_id, property_id, start_date, end_date, status) VALUES
(2, 1, '2025-09-10', '2025-09-15', 'confirmed'),
(1, 2, '2025-09-20', '2025-09-25', 'pending');

-- Reviews
INSERT INTO reviews (user_id, property_id, rating, comment) VALUES
(2, 1, 5, 'Amazing place!'),
(1, 2, 4, 'Great stay, a bit pricey though.');
