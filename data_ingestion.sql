USE superstore_db;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/train.csv'
INTO TABLE Superstore_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Row_ID, @Order_ID, @Order_Date, @Ship_Date, @Ship_Mode,
 @Customer_ID, @Customer_Name, @Segment, @Country, @City, @State,
 @Postal_Code, @Region, @Product_ID, @Category, @Sub_category,
 @Product_Name, @Sales)
 SET
Row_ID = @Row_ID,
Order_ID = @Order_ID,
Ship_Mode = @Ship_Mode,
Customer_ID = @Customer_ID,
Customer_Name = @Customer_Name,
Segment = @Segment,
Country = @Country,
City = @City,
State = @State,
Postal_Code = @Postal_Code,
Region = @Region,
Product_ID = @Product_ID,
Category = @Category,
Sub_category = @Sub_category,
Product_Name = @Product_Name,
Order_Date = STR_TO_DATE(@Order_Date, '%d/%m/%Y'),
Ship_Date  = STR_TO_DATE(@Ship_Date, '%d/%m/%Y'),
Sales = REPLACE(@Sales, ',', '');
