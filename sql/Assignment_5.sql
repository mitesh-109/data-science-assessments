-- Session 5: WHERE Clause + LIKE

-- Q1. Restaurants table

CREATE TABLE restaurants (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  cuisine VARCHAR(50),
  rating DECIMAL(2,1),
  location VARCHAR(100)
);
INSERT INTO restaurants VALUES
(1, 'Swagat', 'South Indian', 4.3, 'Ahmedabad'),
(2, 'Swadisht', 'Gujarati', 4.1, 'Surat'),
(3, 'Dragon Wok', 'Chinese', 3.8, 'Ahmedabad'),
(4, 'Pizza Palace', 'Italian', 4.6, 'Mumbai'),
(5, 'Spice Garden', 'North Indian', 3.4, 'Surat');

-- Q2. Rating > 4.0 in Ahmedabad or Surat
SELECT * FROM restaurants
WHERE rating > 4.0 AND location IN ('Ahmedabad', 'Surat');

-- Q3. Names starting with 'Swa'
SELECT * FROM Restaurants WHERE name LIKE 'Swa%';

-- Q4. Rating between 3.5 and 4.5
SELECT * FROM Restaurants WHERE rating BETWEEN 3.5 AND 4.5;

-- Q5.  Cuisine IN list
SELECT * FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');
 