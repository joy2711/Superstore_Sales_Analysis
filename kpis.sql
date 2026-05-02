#-- This query summarizes key business performance metrics including revenue, order volume, and customer value.
USE superstore_db;
SELECT 
    ROUND(SUM(Sales), 2) AS total_revenue,
    COUNT(DISTINCT Order_ID) AS total_orders,
    COUNT(DISTINCT Customer_ID) AS total_customers,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS avg_order_value,
    ROUND(SUM(Sales) / COUNT(DISTINCT Customer_ID), 2) AS revenue_per_customer
FROM superstore_sales;

