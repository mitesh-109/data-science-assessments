-- Session 6: ORDER BY + Sorting
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO products (product_name, category, price) VALUES
('USB-C Fast Cable', 'Electronics', 9.99),
('Coffee Ceramic Mug', 'Kitchen', 12.50),
('Smartphone Stand', 'Accessories', 15.99),
('Wireless Ergonomic Mouse', 'Electronics', 29.99),
('Waterproof Backpack', 'Accessories', 49.00),
('Mechanical Keyboard', 'Electronics', 89.99),
('Noise-Cancelling Headphones', 'Audio', 199.99),
('4K Gaming Monitor', 'Electronics', 349.99);

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    rating DECIMAL(3, 1) NOT NULL
);

INSERT INTO movies (title, release_year, rating) VALUES
('Dune: Part Two', 2024, 8.6),
('Furiosa', 2024, 7.6),
('Oppenheimer', 2023, 8.9),
('Spider-Man: Across the Spider-Verse', 2023, 8.7),
('Past Lives', 2023, 7.9),
('Top Gun: Maverick', 2022, 8.3),
('The Batman', 2022, 7.8),
('Interstellar', 2014, 8.7);

CREATE TABLE songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    play_count INT NOT NULL,
    added_date DATE NOT NULL
);

INSERT INTO songs (title, artist, play_count, added_date) VALUES
('Blinding Lights', 'The Weeknd', 2500000, '2026-01-10'),
('Levitating', 'Dua Lipa', 1800000, '2026-03-25'),
('Starboy', 'The Weeknd', 1800000, '2026-02-15'),
('Midnight City', 'M83', 1500000, '2026-01-05'),
('As It Was', 'Harry Styles', 1200000, '2026-02-01'),
('Shape of You', 'Ed Sheeran', 950000, '2025-11-20');
-- Q1. Products by price ascending 

SELECT * FROM products ORDER BY price ASC;

-- Q2. Top 5 most expensive
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- Q3. Movies by year desc, then rating desc
SELECT title, release_year, rating
FROM movies
ORDER BY release_year DESC, rating DESC;

-- Q4. First 10 restaurants A-Z
SELECT * FROM restaurants ORDER BY name ASC LIMIT 10;

-- Q5. Top 3 trending songs (ties broken by most recently added)
SELECT * FROM songs
ORDER BY play_count DESC, added_date DESC
LIMIT 3;



