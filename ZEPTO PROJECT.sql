-- Create Database
CREATE DATABASE IF NOT EXISTS Zepto_db;

-- Use the Database
USE Zepto_db;

-- Drop Tables if they exist
DROP TABLE IF EXISTS zepto;

-- Create a Database
CREATE TABLE zepto(
    sku_id INT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);

-- --- Data exploration 
SELECT count(*) FROM zepto;

-- --- Sample data 
SELECT * FROM zepto LIMIT 10;

-- --- Null values
SELECT * FROM zepto
WHERE name IS NULL
or
Category IS NULL
or
mrp IS NULL
or
discountPercent IS NULL
or
availableQuantity IS NULL
or
discountedSellingPrice IS NULL
or
weightInGms IS NULL
or
outOfStock IS NULL
or
quantity IS NULL;

-- -- Different product categories
SELECT DISTINCT Category 
FROM zepto
ORDER BY Category;

-- -- Product in stock VS out of stock 
SELECT outofstock , count(sku_id)
FROM zepto
GROUP BY outofstock;

-- -- Product name present multiple times
SELECT name, count(sku_id) AS 'Number of SKUs'
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

-- -- Data Cleaning 
-- Find out producvt with zero values
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

set SQL_SAFE_UPDATES=0; --- for The safe mode deactivation.

DELETE FROM zepto
WHERE mrp = 0;
-- 	
-- -- mrp Convert paise to rupee
UPDATE zepto
SET mrp = mrp/100,
discountedSellingPrice = discountedSellingPrice/100;

SELECT * FROM zepto;

-- Data Analysis

-- Q1. Find the top 10 best-value products based on the discount percentage?
SELECT DISTINCT name, mrp, discountedSellingPrice
FROM zepto
ORDER BY discountedSellingPrice DESC 
LIMIT 10;

-- Q2.What are the Products with High MRP but Out of Stock?
SELECT DISTINCT name,mrp
FROM zepto 
WHERE outOfStock = 1 AND mrp > 300
ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category?
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%?
SELECT DISTINCT name,mrp,discountPercent
FROM zepto 
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC ,discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage?
SELECT category,
ROUND(AVG(discountPercent),2)AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value?
SELECT DISTINCT name,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk?
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

-- Q8.What is the Total Inventory Weight Per Category?
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

-- Q9.Which products have the largest difference between MRP and discounted price?
SELECT name,
(mrp - discountedSellingPrice) AS price_difference
FROM zepto
ORDER BY price_difference DESC
LIMIT 10;

-- Q10.Which top 5 products occupy the most shelf space (based on weight × available quantity)?
SELECT name,
(weightInGms * availableQuantity) AS total_weight
FROM zepto
ORDER BY total_weight DESC
LIMIT 5;



