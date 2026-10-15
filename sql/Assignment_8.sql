-- Session 8: GROUP BY + HAVING
-- Q1. Orders table (8 records)
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  user_id INT,
  payment_method VARCHAR(20),
  amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1, 101, 'UPI', 250),
(2, 102, 'Card', 520),
(3, 101, 'UPI', 180),
(4, 103, 'COD', 400),
(5, 104, 'Wallet', 150),
(6, 102, 'Card', 700),
(7, 105, 'COD', 350),
(8, 103, 'UPI', 300);

-- Q2. Orders per payment method
SELECT payment_method, COUNT(*) AS total_orders
FROM Orders
GROUP BY payment_method;

-- Q3. Total spend per user
SELECT user_id, SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id;

-- Q4. Payment methods with average amount > 300
SELECT payment_method, AVG(amount) AS avg_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

-- Q5. WHERE vs HAVING
-- WHERE filters individual rows before grouping. HAVING filters groups after aggregation, 
-- so it can use aggregate functions.
-- WHERE: only consider orders above 200, then count per method
SELECT payment_method, COUNT(*) AS cnt
FROM Orders
WHERE amount > 200
GROUP BY payment_method;

-- HAVING: keep only methods that have more than 2 orders in total
SELECT payment_method, COUNT(*) AS cnt
FROM Orders
GROUP BY payment_method
HAVING COUNT(*) > 2;
-- The first removes rows (individual orders); the second removes whole groups (payment methods).



 

