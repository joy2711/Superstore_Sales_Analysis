#Customer Segment
USE superstore_db;
#understand the customer segment
SELECT DISTINCT(Segment) FROM superstore_sales;

#The highest value segment
SELECT SUM(Sales) AS total_sales, Segment FROM superstore_sales
GROUP BY Segment
ORDER BY total_sales DESC;

#customer count per segment
SELECT Segment, COUNT(DISTINCT(Customer_ID)) AS total_customers
FROM superstore_sales
GROUP BY Segment
ORDER BY total_customers DESC;

#preferred categories for each segment
SELECT 
    Segment,
    Category,
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Segment, Category
ORDER BY Segment, total_sales DESC;

#revenue per customer
SELECT 
    Segment,
    ROUND(SUM(Sales) / COUNT(DISTINCT Customer_ID), 2) AS revenue_per_customer
FROM superstore_sales
GROUP BY Segment
ORDER BY revenue_per_customer DESC;

#dependency of each segment on each category
SELECT 
    Segment,
    Category,
    COUNT(DISTINCT Order_ID) AS category_orders,
    SUM(COUNT(DISTINCT Order_ID)) OVER (PARTITION BY Segment) AS total_segment_orders,
    ROUND(
        COUNT(DISTINCT Order_ID) * 1.0 
        / SUM(COUNT(DISTINCT Order_ID)) OVER (PARTITION BY Segment),
    2) AS dependency_ratio
FROM superstore_sales
GROUP BY Segment, Category
ORDER BY Segment, dependency_ratio DESC;