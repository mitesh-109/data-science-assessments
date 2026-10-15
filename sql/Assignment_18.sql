-- Session 18: Interview Questions + Final Revision

-- Q1. Artists with more than 3 songs
SELECT artist, COUNT(*) AS total_songs
FROM songs
GROUP BY artist
HAVING COUNT(*) > 3;

-- Q2. Username with total order amount
SELECT u.username, SUM(o.amount) AS total_order_amount
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.username;

-- Q3. Restaurants rated above average
SELECT name
FROM restaurants
WHERE rating > (SELECT AVG(rating) FROM restaurants);

-- Q4. Running total of transactions per user
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    transaction_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO transactions (user_id, transaction_date, amount) VALUES
(1, '2025-01-01', 150.00),
(1, '2025-01-05', 200.00),
(1, '2025-01-10', 50.00),
(2, '2025-01-02', 300.00),
(2, '2025-01-07', 120.00);

SELECT user_id, transaction_date, amount,
       SUM(amount) OVER (PARTITION BY user_id ORDER BY transaction_date) AS running_total
FROM transactions;

-- Q5. Two optimizations for filtering Flipkart products by category and price
-- 1.	Create a composite index on the filter columns: 
-- First, Indexing: I’d create a composite B-tree index on (category_id, price).
-- Putting category_id first narrows the search space to that category, 
--  and the index can directly do an efficient range scan on price without touching irrelevant rows.

-- 2.	Select only needed columns and filter early: 
-- I’d remove SELECT * to pull only the columns needed for the product card 
-- (like title, image, price) to cut down I/O and network transfer, and use LIMIT 
-- so we only pull 20–30 items per page instead of the entire catalog at once.