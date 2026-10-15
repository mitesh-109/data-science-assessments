-- Session 10: Joins Part 2

-- Q1. FULL JOIN on Influencers and Collaborations

CREATE TABLE Influencers (id INT PRIMARY KEY, name VARCHAR(50));
CREATE TABLE Collaborations (
  id INT PRIMARY KEY,
  influencer1_id INT,
  influencer2_id INT,
  collab_date DATE
);

INSERT INTO Influencers VALUES (1,'Aarav'),(2,'Diya'),(3,'Kabir'),(4,'Meera');
INSERT INTO Collaborations VALUES (1,1,2,'2025-02-01'),(2,2,3,'2025-03-10');
-- MySQL has no FULL JOIN, so it is simulated with LEFT JOIN + UNION + RIGHT JOIN:
SELECT i.id, i.name AS influencer, p.name AS partner
FROM Influencers i
LEFT JOIN Collaborations c ON i.id = c.influencer1_id
LEFT JOIN Influencers p ON p.id = c.influencer2_id
UNION
SELECT i.id, i.name, p.name
FROM Influencers i
RIGHT JOIN Collaborations c ON i.id = c.influencer2_id
RIGHT JOIN Influencers p ON p.id = c.influencer1_id
WHERE i.id IS NOT NULL;
-- (In PostgreSQL/SQL Server you can simply write FROM Influencers i 
-- FULL JOIN Collaborations c ON ....) Influencers with no collaboration 
-- (Meera) still appear with NULL partner.

-- Q2. SELF JOIN on Playlists
SELECT child.playlist_name AS playlist,
       parent.playlist_name AS parent_playlist
FROM Playlists child
LEFT JOIN Playlists parent ON child.parent_playlist_id = parent.playlist_id;

-- Q3. Users, Orders, Payments (all users shown)
CREATE TABLE Payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10, 2)
);
INSERT INTO Payments (order_id, amount) VALUES 
(101, 49.99),
(102, 19.50);
UPDATE payments SET order_id = 1 WHERE id = 1;
UPDATE payments SET order_id = 2 WHERE id = 2;

SELECT u.username, o.order_date, p.amount
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
LEFT JOIN payments p ON o.order_id = p.order_id;

-- Q4. Duplicate rows in Restaurants-Reviews join
CREATE TABLE IF NOT EXISTS Reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    rating INT,
    review_text VARCHAR(255)
);
INSERT INTO Reviews (restaurant_id, rating, review_text) VALUES 
(1, 5, 'Great salsa!'),
(1, 4, 'Good tacos.'),
(1, 5, 'Loved the churros.'),
(2, 3, 'Decent fries.');

SELECT r.id, r.name
FROM Restaurants r
JOIN Reviews rv ON r.id = rv.restaurant_id;
-- Reason: one restaurant has many reviews (one-to-many), 
-- so the restaurant row repeats once per review.

-- Q5. Two join conditions on Products and Categories
CREATE TABLE categories_10 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

-- 3. Insert categories matching your product lines
INSERT INTO categories_10 (id, category_name) VALUES 
(1, 'Electronics'),
(2, 'Kitchen'),
(3, 'Accessories'),
(4, 'Audio');
-- Join 1: on integer ID
SELECT p.product_name, c.category_name
FROM Products p
JOIN Categories_10 c ON p.category_id = c.id;

-- Join 2: on name (text)
SELECT p.product_name, c.category_name
FROM products p
JOIN Categories_10 c ON p.category = c.category_name;
-- The ID-based join is more efficient: integer primary/foreign keys are 
-- indexed, smaller and faster to compare than text strings, and are not 
-- affected by spelling or case differences.
