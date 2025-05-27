CREATE TABLE store (
	row_id VARCHAR(20) PRIMARY KEY,
    Order_ID VARCHAR(20) ,
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(100),
    Customer_ID VARCHAR(15),
    Customer_Name VARCHAR(50),
    Segment VARCHAR(25),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Profit DECIMAL(10, 2),
    returns VARCHAR(50),
    payment_mode VARCHAR(50)
);

drop table store;
select * from store;






