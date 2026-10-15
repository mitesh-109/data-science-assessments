-- Session 4: SELECT Statement Basics

-- Q1. MusicPlaylist table
CREATE TABLE MusicPlaylist (
  id INT PRIMARY KEY,
  song_name VARCHAR(100),
  artist VARCHAR(100),
  genre VARCHAR(50),
  duration INT
);

INSERT INTO MusicPlaylist VALUES
(1, 'Kesariya', 'Arijit Singh', 'Bollywood', 268),
(2, 'Brown Munde', 'AP Dhillon', 'Punjabi Pop', 210),
(3, 'Believer', 'Imagine Dragons', 'Rock', 204),
(4, 'Shape of You', 'Ed Sheeran', 'Pop', 233),
(5, 'Tum Hi Ho', 'Arijit Singh', 'Romantic', 262);

SELECT * FROM MusicPlaylist;

-- Q2. song_name and artist, first 3 records
SELECT song_name, artist FROM MusicPlaylist LIMIT 3;

-- Q3. Unique restaurants

CREATE TABLE FoodOrders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant VARCHAR(100) NOT NULL,
    food_item VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL
);

INSERT INTO FoodOrders (id, restaurant, food_item, order_date) VALUES 
(1, 'Pizza Palace', 'Margherita Pizza', '2026-03-01'), 
(2, 'Burger Barn', 'Cheeseburger', '2026-03-02'), 
(3, 'Pizza Palace', 'Garlic Knots', '2026-03-03'), 
(4, 'Taco Town', 'Crispy Tacos', '2026-03-04');

SELECT DISTINCT restaurant 
FROM FoodOrders;

-- Q4. Aliases
SELECT food_item AS 'Dish', order_date AS 'Date Ordered' FROM FoodOrders;

-- Q5. fix the query.
-- The query SELECT DISTINCT food_item, restaurant 
-- FROM FoodOrders LIMIT 2 is actually valid in MySQL, PostgreSQL and SQLite.
SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2;

SELECT DISTINCT food_item, restaurant
FROM FoodOrders
LIMIT 2;

