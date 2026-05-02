#geographical analysis
USE superstore_db;
#Countries in this dataset
SELECT DISTINCT (Country)
FROM superstore_sales;

#region with most sales
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Region
ORDER BY total_sales DESC;

#states sales analysis
SELECT 
    State,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY State
ORDER BY total_sales DESC
LIMIT 10;

#city sales analysis
SELECT 
    City,
    State,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY City, State
ORDER BY total_sales DESC
LIMIT 10;

#region contribution to sales
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER (), 2) AS percentage_contribution
FROM superstore_sales
GROUP BY Region
ORDER BY total_sales DESC;

#Region plus categories
SELECT 
    Region,
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Region, Category
ORDER BY Region, total_sales DESC;