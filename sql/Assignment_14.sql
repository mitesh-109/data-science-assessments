-- Session 14: Window Functions Part 2
-- Q1. Orders table

CREATE TABLE Orders_14 (
  order_id INT PRIMARY KEY,
  user_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2)
);

INSERT INTO Orders_14 VALUES
(1, 101, '2025-01-01', 250),
(2, 101, '2025-01-05', 400),
(3, 101, '2025-01-12', 300),
(4, 102, '2025-01-02', 550),
(5, 102, '2025-01-09', 200),
(6, 103, '2025-01-03', 150),
(7, 103, '2025-01-15', 350);

-- Q2. LAG (previous order amount)
SELECT user_id, order_id, order_date, total_amount,
       LAG(total_amount) OVER (PARTITION BY user_id ORDER BY order_date) AS previous_amount
FROM Orders_14
ORDER BY user_id, order_date;

-- Q3. LEAD (next order amount)
SELECT order_id, order_date, total_amount,
       LEAD(total_amount) OVER (PARTITION BY user_id ORDER BY order_date) AS next_amount
FROM Orders_14;

-- Q4. Running total per user
SELECT order_id, order_date, total_amount,
       SUM(total_amount) OVER (
         PARTITION BY user_id ORDER BY order_date
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM Orders_14;

-- Q5. 3-order moving average
SELECT order_id, order_date, total_amount,
       SUM(total_amount) OVER (
         PARTITION BY user_id ORDER BY order_date
         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) /
       COUNT(total_amount) OVER (
         PARTITION BY user_id ORDER BY order_date
         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg
FROM Orders_14;
-- This is the SUM-based version as required 
-- (sum of the last 3 orders divided by how many orders are in the window). 
-- It gives the same result as AVG(total_amount) OVER (... ROWS BETWEEN 2 PRECEDING AND CURRENT ROW).
