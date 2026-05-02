CREATE DATABASE superstore_db;
USE superstore_db;
CREATE TABLE Superstore_sales(
	Row_ID varchar(50),
    Order_ID varchar(50),
    Order_Date date,
    Ship_Date date,
    Ship_Mode varchar(50),
    Customer_ID varchar(50),
    Customer_Name varchar(150),
    Segment varchar(50),
    Country varchar(50),
    City varchar(50),
    State varchar (50),
    Postal_Code varchar(50),
    Region varchar (50),
    Product_ID varchar(50),
    Category varchar(50),
    Sub_category varchar(50),
    Product_Name varchar(255),
    Sales decimal(10,2)
    )
 