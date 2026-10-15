-- Session 3: INSERT, UPDATE, DELETE

-- Q1. Create Playlist and insert one row
CREATE TABLE Playlist (
  id INT PRIMARY KEY,
  song_name VARCHAR(100),
  artist VARCHAR(100),
  duration INT
);

INSERT INTO Playlist VALUES (1, 'Kesariya', 'Arjit Singh', 268);

-- Q2. Insert 3 more rows
INSERT INTO Playlist (id, song_name, artist, duration) VALUES
(2, 'Brown Munde', 'AP Dhillon', 210),
(3, 'Excuses', 'AP Dhillon', 195),
(4, 'Jhoome Jo Pathaan', 'Arijit Singh', 110);

-- Q3. Fix artist typo
UPDATE Playlist
SET artist = 'Arijit Singh'
WHERE id = 1;

-- Q4. Delete songs shorter than 120 seconds
DELETE FROM Playlist 
WHERE duration < 120 
  AND id > 0;

-- Q5. Add '(Remix)' for AP Dhillon songs longer than 180 seconds
UPDATE Playlist 
SET song_name = CONCAT(song_name, ' (Remix)') 
WHERE artist = 'AP Dhillon' 
  AND duration > 180
  AND id > 0; 
  