-- Phase 1: Project 1 - Core E-Commerce Ledger Report
-- Extracts user transactions, matches inventory metrics, and computes total sales volume

SELECT
	users.first_name || ' ' || users.last_name AS customer_name,
	products.name AS product_name,
	orders.quantity AS quantity_purchased,
	products.price AS unit_price,
	(orders.quantity * products.price) AS total_amount_spent

FROM orders
INNER JOIN users ON orders.user_id = users.user_id
INNER JOIN products ON orders.product_id = products.product_id;
