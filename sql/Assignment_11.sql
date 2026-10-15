use foodie_app;
-- Session 11: Subqueries

-- Q1. Restaurants rated above the city average
SELECT name, location, rating
FROM Restaurants
WHERE rating > (SELECT AVG(rating) FROM Restaurants);

-- Q2. Subquery in SELECT: user with order count
SELECT 
    u.username,
    (SELECT COUNT(*) 
     FROM Orders o 
     WHERE o.user_id = u.user_id) AS total_orders
FROM Users u;

-- Q3. Movies with at least one 5-star review (IN)
SELECT title
FROM Movies
WHERE id IN (SELECT id FROM Reviews WHERE rating = 5);


-- Q4. Sellers who sold in every category (nested)
CREATE TABLE IF NOT EXISTS Sellers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO Sellers (id, seller_name, email) VALUES
(1, 'Apex Global', 'apex@example.com'),
(2, 'Bella Treats', 'bella@example.com'),
(3, 'Corner Shop', 'corner@example.com');

SELECT s.seller_name
FROM Sellers s
WHERE NOT EXISTS (
  SELECT 1 FROM Categories c
  WHERE NOT EXISTS (
    SELECT 1 FROM Products p
    WHERE p.seller_id = s.id AND p.category_id = c.id
  )
);
-- Logic: a seller qualifies if there is NO category for which the seller has NO product.
