-- Phase 1: Project 1 - Core E-Commerce Data Seed
-- Populates tracking tables with baseline validation data

-- Clear out any existing data before seeding (Truncate safely clears data without dropping the schema)
-- CASCADE automatically clears dependent rows in the orders table

Truncate TABLE users, products CASCADE;

-- 1. Seed Users
INSERT INTO users(first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@email.com'),
('Jane', 'Smith', 'jane.smith@email.com'),
('Alex', 'Turner', 'alex.t@email.com'),
('Chidi', 'Nnamdi', 'chidi.n@email.com');

-- 2. Seed products
INSERT INTO products(name, description, price, stock_quantity) VALUES
('System Architecture Blueprint', 'Complete guide to distributed system design.', 15000.00, 50),
('Mechanical Keyboard', 'Tactile brown switches with custom keycaps.', 45000.00, 15),
('UltraWide Monitor', '34-inch curved productivity display.', 180000.00, 8),
('Leather Journal', 'Minimalist dot-grid notebook for engineering notes.', 7500.00, 100);

-- 3. Seed Orders (linking users and products via primary keys 1 through 4)
INSERT INTO orders(user_id, product_id, quantity) VALUES
(1, 1, 1), -- John Doe bought 1 Architecture Blueprint
(1, 4, 2), -- John Doe bought 2 Leather Journals
(2, 2, 1), -- Jane Smith bought 1 Mechanical Keyboard
(3, 3, 1), -- Alex Turner bought 1 UltraWide Monitor
(4, 1, 1), -- Chidi Nnamdi bought 1 Architecture Blueprint
(4, 4, 5); -- Chidi Nnamdi bought 5 Leather Journals
