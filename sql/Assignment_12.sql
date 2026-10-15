-- Session 12: CTE (WITH clause)

-- Q1. Top-rated products
WITH top_products AS (
  SELECT * FROM Products WHERE rating > 4.5
)
SELECT * FROM top_products;

-- Q2. Subquery vs CTE

-- Subquery version
SELECT name FROM (
  SELECT * FROM Restaurants
  WHERE location = 'Ahmedabad' AND delivery_charge < 50
) AS t;

-- CTE version
WITH cheap_delivery AS (
  SELECT * FROM Restaurants
  WHERE location = 'Ahmedabad' AND delivery_charge < 50
)
SELECT name FROM cheap_delivery;
-- The CTE version is easier to read: the filtering logic is named and defined first, and the main query reads top to bottom instead of being nested.

-- Q3. Two CTEs: top 3 users and top 3 posts


CREATE TABLE IF NOT EXISTS Posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    caption VARCHAR(255),
    likes INT DEFAULT 0
);

UPDATE Users SET followers = 1200 WHERE user_id = 1;
UPDATE Users SET followers = 4500 WHERE user_id = 2;
UPDATE Users SET followers = 3100 WHERE user_id = 3;

INSERT INTO Posts (caption, likes) VALUES
('Great food here!', 450),
('Sunday brunch vibes', 1200),
('Best pizza in town', 890);


WITH top_users AS (
  SELECT 'User' AS type, username AS name, followers AS value
  FROM Users ORDER BY followers DESC LIMIT 3
),
top_posts AS (
  SELECT 'Post' AS type, caption AS name, likes AS value
  FROM Posts ORDER BY likes DESC LIMIT 3
)
SELECT * FROM top_users
UNION ALL
SELECT * FROM top_posts;

-- Q4. Recursive CTE: next 7 days
WITH RECURSIVE next_days AS (
  SELECT CURDATE() AS show_date
  UNION ALL
  SELECT show_date + INTERVAL 1 DAY
  FROM next_days
  WHERE show_date < CURDATE() + INTERVAL 6 DAY
)
SELECT show_date FROM next_days;

-- The base case is today; each recursion adds one day until 7 dates are produced.

-- Q5. Refactor with a CTE
-- Messy:
SELECT username FROM (SELECT * FROM Users WHERE followers > 1000) x WHERE x.username IS NOT NULL;

-- Refactored:
WITH popular_users AS (
  SELECT username, followers
  FROM Users
  WHERE followers > 1000
)
SELECT username FROM popular_users WHERE username IS Not NULL;
