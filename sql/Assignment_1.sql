-- Session 1: Database Introduction & SQL Basics

-- Q1. Install MySQL and create database music_streaming_app
-- Download MySQL Community Server and MySQL Workbench from dev.mysql.com, run the installer,
--  set a root password, then open Workbench or the command line (mysql -u root -p).

CREATE DATABASE music_streaming_app;
USE music_streaming_app;
SHOW DATABASES;

-- Q2. Create table playlists
CREATE TABLE playlists (
  playlist_id INT PRIMARY KEY,
  name VARCHAR(100),
  created_by VARCHAR(50)
);

-- Q3. Insert three rows.
INSERT INTO playlists (playlist_id, name, created_by) VALUES
(1, 'Bollywood Hits', 'Amit'),
(2, 'Chill Vibes', 'Neha'),
(3, 'Workout Mix', 'Rahul');

-- Q4. Playlists created by Amit.
SELECT * FROM playlists WHERE created_by = 'Amit';

-- Q5. Table vs Row vs Column (Zomato example)
-- •	Table: a collection of related data about one thing. Example: the Restaurants table stores all restaurants on Zomato.
-- •	Row (record): one complete entry in a table. Example: one row is 'Swagat, Gujarati, 4.3, Ahmedabad', which is a single restaurant.
-- •	Column (field): one attribute stored for every row. Example: the rating column holds the rating of every restaurant.
-- So a table is the whole spreadsheet-like structure, rows are the individual items, and columns are the properties of those items.
