-- Phase 1: Project 1 - Core E-Commerce Schema
-- Enforces absolute relational integrity

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS users;

-- 1. Users Table
CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 2. Products Table
CREATE TABLE products(
	product_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description TEXT,
	price NUMERIC(10,2) NOT NULL,
	stock_quantity INT NOT NULL DEFAULT 0,
	created_at TIMESTAMP DEFAUlT CURRENT_TIMESTAMP
);


-- 3. Orders Table
CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL CHECK(quantity > 0),
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	-- Foreign key Constraints
	CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
	CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE RESTRICT

);
