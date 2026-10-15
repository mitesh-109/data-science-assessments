-- Session 17: SQL + Restaurant Analysis
-- Q1. Restaurant table
CREATE TABLE Restaurant_17 (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  cuisine VARCHAR(50),
  location VARCHAR(100),
  average_rating DECIMAL(2,1)
);

INSERT INTO Restaurant_17 VALUES
(1, 'Truffles', 'Continental', 'Koramangala', 4.5),
(2, 'Meghana Foods', 'Biryani', 'Indiranagar', 4.4),
(3, 'Empire', 'North Indian', 'Jayanagar', 4.0),
(4, 'CTR', 'South Indian', 'Malleshwaram', 4.6),
(5, 'Toit', 'Continental', 'Indiranagar', 4.3);

-- Q2. Restaurants per cuisine
SELECT cuisine, COUNT(*) AS restaurant_count
FROM Restaurant_17
GROUP BY cuisine
ORDER BY restaurant_count DESC;

-- Q3. Review table (10 reviews)
CREATE TABLE Review_17 (
  id INT PRIMARY KEY,
  restaurant_id INT,
  user_name VARCHAR(50),
  rating INT,
  review_date DATE
);

INSERT INTO Review_17 VALUES
(1, 1, 'Amit', 5, '2025-01-02'),
(2, 1, 'Neha', 4, '2025-01-04'),
(3, 2, 'Rahul', 5, '2025-01-05'),
(4, 2, 'Priya', 4, '2025-01-06'),
(5, 3, 'Karan', 3, '2025-01-07'),
(6, 3, 'Sneha', 4, '2025-01-08'),
(7, 4, 'Vikram', 5, '2025-01-09'),
(8, 4, 'Anita', 5, '2025-01-10'),
(9, 5, 'Rohit', 4, '2025-01-11'),
(10, 5, 'Meera', 3, '2025-01-12');

-- Q4. Average review rating per restaurant
SELECT r.name, r.cuisine, AVG(rv.rating) AS avg_review_rating
FROM Restaurant_17 r
JOIN Review_17 rv ON r.id = rv.restaurant_id
GROUP BY r.id, r.name, r.cuisine
ORDER BY avg_review_rating DESC;

-- Q5. Rank within each cuisine
SELECT r.name, r.cuisine, AVG(rv.rating) AS avg_rating,
       RANK() OVER (PARTITION BY r.cuisine ORDER BY AVG(rv.rating) DESC) AS rnk
FROM Restaurant_17 r
JOIN Review_17 rv ON r.id = rv.restaurant_id
GROUP BY r.id, r.name, r.cuisine;
