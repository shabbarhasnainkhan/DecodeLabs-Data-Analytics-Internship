#Project-3-SQL-Data-Analysis

##1. Data Understanding
Use sales_data_analysis;

SELECT *
FROM sales_data
LIMIT 10;

-- Total records --
SELECT Count(*) AS Total_Rows
FROM sales_data;

-- Prouducts --
SELECT DISTINCT Product
FROM sales_data; 

-- Payments methods --
SELECT DISTINCT PaymentMethod
FROM sales_data;

-- Order statuses --
SELECT DISTINCT OrderStatus
FROM sales_data;

-- Referral sources --
SELECT DISTINCT ReferralSource
FROM sales_data;

##2. Sales Overview

-- Total orders --
SELECT COUNT(*) AS Total_Orders
FROM sales_data;

-- Total items sold --
SELECT SUM(Quantity) AS Total_Items_Sold
FROM sales_data; 

-- Total revenue --
SELECT SUM(TotalPrice) AS Total_Revenue
FROM sales_data;

-- Average order value --
SELECT AVG(TotalPrice) AS Average_Order_Value
FROM sales_data;

##3. Product Performance

-- Sales by product --
SELECT Product, SUM(Quantity) AS Total_Items_Sold, SUM(TotalPrice) AS Total_Revenue
FROM sales_data
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- Average price by product --
 SELECT Product, AVG(UnitPrice) AS Average_Unit_Price
 FROM sales_data
 GROUP BY Product
 ORDER BY Average_Unit_Price DESC;
 
 -- Most frequantly ordered product --
 SELECT Product, COUNT(*) AS Number_of_Orders
 FROM sales_data
 GROUP BY Product
 ORDER BY Number_of_Orders DESC;
 
 ##4. Customers and Order Analysis
 
 -- Unique customers --
 SELECT COUNT(DISTINCT CustomerID) AS Unique_Customers
 FROM sales_data;

-- Customers with most orders --
SELECT CustomerID, COUNT(*) AS Number_of_Orders
FROM sales_data
GROUP BY CustomerID
ORDER BY Number_of_Orders DESC;

-- Highest value orders --
SELECT OrderID, CustomerID, Product, TotalPrice
FROM sales_data
ORDER BY TotalPrice DESC
LIMIT 10;

-- Average items in cart --
SELECT AVG(ItemsInCart) AS Average_Items_in_Cart
FROM sales_data;

##5. Payment and Order Status Analysis

-- Orders by payment methods --
SELECT PaymentMethod, COUNT(*) AS Number_of_Orders
FROM sales_data
GROUP BY PaymentMethod
ORDER BY Number_of_Orders DESC;

-- Revenue by payment method --
SELECT PaymentMethod, SUM(TotalPrice) AS Total_Revenue
FROM sales_data
GROUP BY PaymentMethod
ORDER BY Total_Revenue DESC;

-- Orders by order status --
SELECT OrderStatus, COUNT(*) AS Number_of_Orders
FROM sales_data
GROUP BY OrderStatus
ORDER BY Number_of_Orders DESC;

##6. Marketing and Referral Analysis

-- Orders by referral source --
SELECT ReferralSource, COUNT(*) AS Number_of_Orders
FROM sales_data
GROUP BY ReferralSource
ORDER BY Number_of_Orders DESC;

-- Revenue by referral source --
SELECT ReferralSource, SUM(TotalPrice) AS Total_Revenue
FROM sales_data
GROUP BY ReferralSource
ORDER BY Total_Revenue DESC;

-- Coupon Usage --
SELECT CouponCode, COUNT(*) AS Number_of_Orders
FROM sales_data
GROUP BY CouponCode
ORDER BY Number_of_Orders;

##7. Monthly Sales Analysis
UPDATE sales_data
SET `Date` = STR_TO_DATE(`Date`, "%d/%m/%Y");

-- Orders by month --
SELECT MONTH(`Date`) AS `Month`, COUNT(*) AS Number_of_Orders
FROM sales_data
GROUP BY MONTH(`Date`)
ORDER BY `Month`;

-- Revenue by month --
SELECT MONTH(`Date`) AS `Month`, SUM(TotalPrice) AS Total_Revenue
FROM sales_data
GROUP BY MONTH(`Date`)
ORDER BY `Month`;

-- Average order value by month --
SELECT MONTH(`Date`) AS `Month`, AVG(TotalPrice) AS Average_Order_Value
FROM sales_data
GROUP BY MONTH(`Date`)
ORDER BY `Month`;

##8. Final Business Insights

-- Top 10 highiest-value orders --
SELECT OrderID, CustomerID, Product, Quantity, TotalPrice
FROM sales_data
ORDER BY TotalPrice DESC
LIMIT 10;

-- Business Summary --
SELECT 
     COUNT(*) AS Total_Orders,
     COUNT(DISTINCT CustomerID) AS Unique_Customers,
     SUM(Quantity) AS Total_Items_Sold,
     SUM(TotalPrice) AS Total_Revenue,
     AVG(TotalPrice) AS Average_Order_Value
FROM sales_data;




