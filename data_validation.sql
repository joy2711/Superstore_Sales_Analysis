USE superstore_db;

-- Check total number of records
SELECT COUNT(*) AS total_rows 
FROM superstore_sales;

-- Check date range of the dataset
SELECT 
    MIN(Order_Date) AS start_date, 
    MAX(Order_Date) AS end_date 
FROM superstore_sales;

-- Identify potential duplicate records (same Order_ID + Product_ID)
SELECT 
    Order_ID, 
    Product_ID, 
    COUNT(*) AS duplicate_count
FROM superstore_sales
GROUP BY Order_ID, Product_ID
HAVING COUNT(*) > 1;

-- Check for missing values in key columns
SELECT 
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS missing_product_id
FROM superstore_sales;

-- Check for missing or invalid shipping dates
SELECT *
FROM superstore_sales
WHERE Ship_Date IS NULL;

-- Check for logical errors (Ship_Date before Order_Date)
SELECT *
FROM superstore_sales
WHERE Ship_Date < Order_Date;