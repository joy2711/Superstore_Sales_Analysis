USE superstore_db;

-- 1. Total number of unique products
SELECT 
    COUNT(DISTINCT Product_ID) AS total_products
FROM superstore_sales;

-- 2. Sales performance by category
SELECT 
    Category, 
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Category
ORDER BY total_sales DESC;

-- 3. Sales performance by sub-category
SELECT 
    Sub_category, 
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Sub_category
ORDER BY total_sales DESC;

-- 4. Top 10 products by revenue
SELECT 
    Product_Name, 
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_sales DESC
LIMIT 10;

-- 5. Bottom 5 products by revenue (more insightful than 1)
SELECT 
    Product_Name, 
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Product_Name
HAVING SUM(Sales) > 0
ORDER BY total_sales ASC
LIMIT 5;

-- 6. Most frequently purchased products (demand drivers)
SELECT 
    Product_Name,
    COUNT(DISTINCT Order_ID) AS purchase_frequency,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Product_Name
ORDER BY purchase_frequency DESC
LIMIT 10;

-- 7. High revenue but low frequency products (premium items)
SELECT 
    Product_Name,
    COUNT(DISTINCT Order_ID) AS purchase_frequency,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Product_Name
HAVING COUNT(DISTINCT Order_ID) < 50  -- adjust threshold if needed
ORDER BY total_sales DESC
LIMIT 10;

-- 8. Category contribution to total revenue (%)
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER (), 2) AS percentage_contribution
FROM superstore_sales
GROUP BY Category
ORDER BY total_sales DESC;