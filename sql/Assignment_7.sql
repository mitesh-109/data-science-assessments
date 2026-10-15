-- Session 7: Aggregate Functions  
-- Q1. Orders table with a NULL
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  user_name VARCHAR(50),
  total_amount DECIMAL(10,2),
  order_date DATE
);

INSERT INTO Orders VALUES
(1, 'Amit', 450.00, '2025-01-05'),
(2, 'Neha', 800.50, '2025-01-06'),
(3, 'Amit', 120.00, '2025-01-08'),
(4, 'Rahul', NULL, '2025-01-09'),
(5, 'Neha', 650.00, '2025-01-10');

-- Q2. Orders per user
SELECT user_name, COUNT(*) AS order_count
FROM Orders
GROUP BY user_name;

-- Q3. Average amount (NULLs ignored automatically by AVG)
SELECT AVG(total_amount) AS avg_amount FROM Orders;

-- Q4. Highest and lowest in one row
SELECT MAX(total_amount) AS highest_order, MIN(total_amount) AS lowest_order
FROM Orders;

-- Q5. Total sales excluding NULL
SELECT SUM(total_amount) AS total_sales
FROM Orders
WHERE total_amount IS NOT NULL;


