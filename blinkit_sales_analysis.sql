-- SQL BLINKIT SALES ANALYSIS PROJECT

CREATE DATABASE blinkit_db;
USE blinkit_db;


-- CREATE TABLE BLINKIT DATA
CREATE TABLE blinkit_data (
    Item_Fat_Content VARCHAR(20),
    Item_Identifier VARCHAR(20),
    Item_Type VARCHAR(50),
    Outlet_Establishment_Year INT,
    Outlet_Identifier VARCHAR(20),
    Outlet_Location_Type VARCHAR(20),
    Outlet_Size VARCHAR(20),
    Outlet_Type VARCHAR(30),
    Item_Visibility DOUBLE,
    Item_Weight DOUBLE,
    Total_Sales DOUBLE,
    Rating INT 
);

-- SELECT all imported data
SELECT * FROM blinkit_data;


-- DATA CLEANING

-- Renaming all the labels correctly
UPDATE blinkit_data
SET Item_Fat_Content =
CASE
    WHEN Item_Fat_Content IN ('low fat', 'LF') THEN 'Low Fat'
    WHEN Item_Fat_Content = 'reg' THEN 'Regular'
    ELSE Item_Fat_Content
END;
-- All labels are now named uniformly



-- Checking if the data is cleaned or not 
SELECT DISTINCT Item_Fat_Content FROM blinkit_data;

-- A. KPI's

-- 1. TOTAL SALES
SELECT 
CONCAT(ROUND(SUM(Total_Sales)/1000000,2),' M')
 AS Total_Sales_Million
FROM blinkit_data;
-- Insight: Total sales is approximately Rs. 1.2 Million.


-- 2. AVERAGE REVENUE
SELECT 
ROUND(AVG(Total_Sales),2) AS Avg_Sales
FROM blinkit_data;
-- Insight: Average sales per transaction is Rs. 140.99.


-- 3. Number of Items
SELECT 
COUNT(*) AS Total_Records
FROM blinkit_data;
-- Insight: Total number of transactions is 8524.


-- 4. Average Rating
SELECT 
ROUND(AVG(Rating),1) AS Avg_Rating
FROM blinkit_data;
-- Insight: Average customer rating is 4.0.


-- Query 1: Total Sales by Fat Content:
SELECT Item_Fat_Content,
CONCAT(ROUND(SUM(Total_Sales)/100000,2), ' L') AS Total_Sales_Lakhs
FROM blinkit_data
GROUP BY Item_Fat_Content;
-- Insight: Low Fat products have higher sales (7.76 Lakhs) compared to Regular products (4.25 Lakhs).



-- Query 2: Total Sales by Item Type
SELECT Item_Type,
CONCAT(ROUND(SUM(Total_Sales)/100000,2),' L') AS Total_Sales_Lakhs
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales_Lakhs DESC
LIMIT 5;
-- Insight: Fruits and Vegetables generate the highest sales (1.78 Lakhs).


-- Query 3: Fat Content by Outlet for Total Sales
SELECT Outlet_Location_Type,
CONCAT(ROUND(IFNULL(SUM(CASE 
WHEN Item_Fat_Content = 'Low Fat' 
THEN Total_Sales 
END), 0) / 1000, 2
), ' K') AS Low_Fat,

CONCAT(ROUND(IFNULL(SUM(CASE 
WHEN Item_Fat_Content = 'Regular' 
THEN Total_Sales 
END), 0) / 1000, 2
), ' K') AS Regular

FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type DESC;
-- Insight: Tier 3 has the highest sales in both Low_Fat(306.81 K) and Regular (165.33 K)


-- Query 4: Total Sales by Outlet Establishment
SELECT Outlet_Establishment_Year,
CONCAT(ROUND(SUM(Total_Sales)/100000,2),' L') AS Total_Sales_Lakhs
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales_Lakhs DESC;
-- Insight: 1998 generates the highest sales (2.05 Lakhs).


-- Query 5: Percentage of Sales by Outlet Size
SELECT Outlet_Size,
CONCAT(ROUND(SUM(Total_Sales)/1000, 2), ' K') AS Total_Sales,
CONCAT(ROUND(SUM(Total_Sales) * 100 / (SELECT SUM(Total_Sales) FROM blinkit_data),2),' %') AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY SUM(Total_Sales) DESC;
-- Insight: Medium outlet size has the highest sales (507.9 K) and sales percentage (42.27 %)


-- Query 6: Sales by Outlet Location
SELECT Outlet_Location_Type,
CONCAT(ROUND(SUM(Total_Sales)/100000,2), ' L') AS Total_Sales_Lakhs
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales_Lakhs DESC;
-- Insight: Tier 3 outlet location type has highest sales 4.72 Lakhs.


-- Query 7: All Metrics by Outlet Type
SELECT Outlet_Type,
CONCAT(ROUND(SUM(Total_Sales)/100000, 2), ' L') AS Total_Sales,
ROUND(AVG(Total_Sales), 0) AS Avg_Sales,
COUNT(*) AS  Total_Records,
ROUND(AVG(Rating), 2) AS Avg_Rating,
ROUND(AVG(Item_Visibility), 2) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY SUM(Total_Sales) DESC;
-- Insight: Supermarket Type1 has the highest sales 7.88 L.


