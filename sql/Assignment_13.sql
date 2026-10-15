-- Session 13: Window Functions Part 1

-- Q1. Playlists table
CREATE TABLE Playlists_13 (
  id INT PRIMARY KEY,
  user_id INT,
  playlist_name VARCHAR(100),
  total_likes INT
);

INSERT INTO Playlists_13 VALUES
(1, 1, 'Bollywood Hits', 500),
(2, 1, 'Workout Mix', 320),
(3, 1, 'Chill Vibes', 320),
(4, 2, 'Punjabi Beats', 750),
(5, 2, 'Road Trip', 410),
(6, 3, 'Lofi Study', 600),
(7, 3, 'Retro Gold', 150),
(8, 3, 'Party Mix', 600);

-- Q2. ROW_NUMBER
SELECT playlist_name, total_likes,
       ROW_NUMBER() OVER (ORDER BY total_likes DESC) AS row_num
FROM Playlists_13;

-- Q3. RANK
SELECT playlist_name, user_id, total_likes,
       RANK() OVER (ORDER BY total_likes DESC) AS rnk
FROM Playlists_13;

-- Q4. DENSE_RANK per user
SELECT playlist_name, user_id, total_likes,
       DENSE_RANK() OVER (PARTITION BY user_id ORDER BY total_likes DESC) AS dense_rnk
FROM Playlists_13;

-- Q5. Top 2 playlists per user
WITH ranked AS (
  SELECT playlist_name, user_id, total_likes,
         ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY total_likes DESC) AS rn
  FROM Playlists_13
)
SELECT playlist_name, user_id, total_likes
FROM ranked
WHERE rn <= 2;
