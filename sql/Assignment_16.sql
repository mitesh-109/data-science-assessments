-- Session 16: SQL Project: Sales Analysis

-- Q1. Import CSV into FoodOrders
-- Sample food_orders.csv:
-- order_id,restaurant_name,customer_name,order_amount,order_date
-- 1,Swagat,Amit,450,2025-01-05
-- 2,Dragon Wok,Neha,820,2025-01-06
-- 3,Swagat,Amit,300,2025-01-08
-- 4,Pizza Palace,Rahul,950,2025-01-09
-- 5,Dragon Wok,Neha,400,2025-01-10
-- 6,Swagat,Priya,260,2025-01-11

CREATE TABLE FoodOrders_16 (
  order_id INT PRIMARY KEY,
  restaurant_name VARCHAR(100),
  customer_name VARCHAR(100),
  order_amount DECIMAL(10,2),
  order_date DATE
);

INSERT INTO FoodOrders_16 (order_id, restaurant_name, customer_name, order_amount, order_date) VALUES
(1, 'Swagat', 'Amit', 450.00, '2025-01-05'),
(2, 'Dragon Wok', 'Neha', 820.00, '2025-01-06'),
(3, 'Swagat', 'Amit', 300.00, '2025-01-08'),
(4, 'Pizza Palace', 'Rahul', 950.00, '2025-01-09'),
(5, 'Dragon Wok', 'Neha', 400.00, '2025-01-10'),
(6, 'Swagat', 'Priya', 260.00, '2025-01-11');

-- Import using MySQL Workbench: right-click the table, 
-- choose Table Data Import Wizard, select the CSV and finish. Or by command:

-- Q2. TopSongs table
CREATE TABLE TopSongs (
  song_id INT PRIMARY KEY,
  song_title VARCHAR(100),
  artist VARCHAR(100),
  streams BIGINT,
  release_date DATE
);

INSERT INTO TopSongs VALUES
(1, 'Blinding Lights', 'The Weeknd', 4500000000, '2019-11-29'),
(2, 'Shape of You', 'Ed Sheeran', 3900000000, '2017-01-06'),
(3, 'Kesariya', 'Arijit Singh', 700000000, '2022-07-17'),
(4, 'Believer', 'Imagine Dragons', 3200000000, '2017-02-01'),
(5, 'Brown Munde', 'AP Dhillon', 500000000, '2020-10-16');

-- Q3. Top 3 customers by total spend
SELECT customer_name, SUM(order_amount) AS total_spent
FROM FoodOrders_16
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- Q4. Restaurant performance report
SELECT restaurant_name,
       COUNT(*) AS number_of_orders,
       SUM(order_amount) AS total_order_amount
FROM FoodOrders_16
GROUP BY restaurant_name
ORDER BY total_order_amount DESC;

-- Q5. Dashboard KPIs
SELECT 'Average Order Amount' AS kpi_name, ROUND(AVG(order_amount), 2) AS kpi_value
FROM FoodOrders_16
UNION ALL
SELECT 'Unique Customers', COUNT(DISTINCT customer_name)
FROM FoodOrders_16;
