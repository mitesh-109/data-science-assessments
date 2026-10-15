-- Session 2: Database Setup + CREATE TABLE

-- Q1. Install and verify
-- Install MySQL Community Server + Workbench. Verify:
SELECT VERSION();
SHOW DATABASES;

-- Q2. Create database
CREATE DATABASE foodie_app;
USE foodie_app;

-- Q3. restaurants table
CREATE TABLE restaurants (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  cuisine VARCHAR(50),
  rating DECIMAL(2,1),
  location VARCHAR(100)
);

-- Q4. users table (Flipkart style)
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone_number VARCHAR(15) UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Email and username are UNIQUE so no two users share them.
-- Phone number is VARCHAR (not INT) because it can start with 
-- 0 or +91 and we never do arithmetic on it.
 
--  Q5. Intentional mistake and fix
-- Wrong (missing comma after name):
CREATE TABLE test_table (
  id INT PRIMARY KEY,
  name VARCHAR(50)
  city VARCHAR(50)
);
-- Error Code: 1064. You have an error in your SQL syntax; 
-- check the manual that corresponds to your MySQL server version for 
-- the right syntax to use near 'city VARCHAR(50)
--  )' at line 4	0.000 sec
 
 -- Fixed:
CREATE TABLE test_table (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  city VARCHAR(50)
);

