#shipping time analysis
SELECT 
    Ship_Mode,
    ROUND(AVG(DATEDIFF(Ship_Date, Order_Date)), 2) AS avg_shipping_days
FROM superstore_sales
GROUP BY Ship_Mode
ORDER BY avg_shipping_days;