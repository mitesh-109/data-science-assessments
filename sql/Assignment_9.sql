-- Session 9: Joins Part 1

-- Q1. Tables and data
CREATE TABLE restaurants_9 (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(50)
);

CREATE TABLE dishes (
  id INT PRIMARY KEY,
  restaurant_id INT,
  dish_name VARCHAR(100),
  price DECIMAL(8,2)
);

INSERT INTO restaurants_9 VALUES
(1, 'Swagat', 'Ahmedabad'),
(2, 'Dragon Wok', 'Surat'),
(3, 'Pizza Palace', 'Mumbai'),
(4, 'New Cafe', 'Pune');   

INSERT INTO dishes VALUES
(1, 1, 'Masala Dosa', 120),
(2, 1, 'Idli Sambar', 90),
(3, 2, 'Hakka Noodles', 180),
(4, 2, 'Manchurian', 160),
(5, 3, 'Margherita Pizza', 300),
(6, 3, 'Pasta Alfredo', 280),
(7, 99, 'Mystery Thali', 150);

-- Q2. INNER JOIN
SELECT d.dish_name, d.price, r.name AS restaurant_name, r.city
FROM dishes d
INNER JOIN restaurants_9 r ON d.restaurant_id = r.id;

-- Q3. LEFT JOIN (restaurants even without dishes)
SELECT r.name, r.city, d.dish_name, d.price
FROM restaurants_9 r
LEFT JOIN dishes d ON r.id = d.restaurant_id;

-- 'New Cafe' appears with NULL in the dish columns.

-- Q4. RIGHT JOIN (all dishes, even orphaned ones)

SELECT d.dish_name, d.price, r.name AS restaurant_name
FROM restaurants r
RIGHT JOIN dishes d ON r.id = d.restaurant_id;

-- 'Mystery Thali' appears with NULL restaurant name because restaurant_id 99 does not exist.

-- Q5. All playlists, even empty ones (Spotify)
CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_name VARCHAR(100) NOT NULL
);
INSERT INTO playlists (playlist_name) VALUES 
('Workout Hype'), 
('Chill Vibes'), 
('Study Beats');

CREATE TABLE playlist_songs (
    playlist_id INT,
    song_id INT,
    PRIMARY KEY (playlist_id, song_id)
);
INSERT INTO playlist_songs (playlist_id, song_id) VALUES
(1, 1),
(1, 2),
(2, 2), 
(2, 3);
-- Use LEFT JOIN with playlists as the left table, 
-- because LEFT JOIN keeps every row of the left table 
-- whether or not it has matching songs. INNER JOIN would hide empty playlists.
SELECT p.playlist_name, s.title AS song_name
FROM playlists p
LEFT JOIN playlist_songs ps ON p.playlist_id = ps.playlist_id
LEFT JOIN songs s ON ps.song_id = s.id;

