#time series analysis
USE superstore_db;
#Sales by Year
SELECT 
    YEAR(Order_Date) AS year,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY year
ORDER BY year;

#Monthly trend
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY month
ORDER BY month;

#Best Performing Month
SELECT 
	MONTH (Order_Date) AS month_number,
    MONTHNAME(Order_Date) AS month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY month_number, month
ORDER BY total_sales DESC;

#daily Sales Trend
SELECT order_date, ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY order_date
ORDER BY order_date;