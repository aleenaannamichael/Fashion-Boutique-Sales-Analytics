CREATE DATABASE fashion_boutique;
USE fashion_boutique;

CREATE TABLE fashion_sales (
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    Season VARCHAR(50), 
    Size VARCHAR(20),
    Color VARCHAR(30),
    Original_price DECIMAL(10,2),
    Markdown_percentage DECIMAL(5,2),
    Current_price DECIMAL(10,2),
    Discount_amount DECIMAL(10,2),
    Price_category VARCHAR(50),
    Purchase_date DATE,
    Purchase_month VARCHAR(50)
);

SELECT * 
FROM fashion_sales;

SELECT COUNT(*) AS Total_Records
FROM fashion_sales;

SELECT DISTINCT Category
FROM fashion_sales;

SELECT DISTINCT Brand
FROM fashion_sales;

SELECT *
FROM fashion_sales
WHERE Current_price > 100;

SELECT *
FROM fashion_sales
WHERE Markdown_percentage > 30;

SELECT Product_ID, Brand, Current_price
FROM fashion_sales
ORDER BY Current_price DESC;

SELECT *
FROM fashion_sales
ORDER BY Current_price DESC
LIMIT 10;

SELECT ROUND(SUM(Current_price),2) AS Total_Revenue
FROM fashion_sales;

SELECT ROUND(AVG(Current_price),2) AS Average_Selling_Price
FROM fashion_sales;

SELECT ROUND(SUM(Discount_amount),2) AS Total_Discount
FROM fashion_sales;

SELECT MAX(Current_price) AS Highest_Price
FROM fashion_sales;

SELECT MIN(Current_price) AS Lowest_Price
FROM fashion_sales;

SELECT
Category,
ROUND(SUM(Current_price),2) AS Revenue
FROM fashion_sales
GROUP BY Category
ORDER BY Revenue DESC;

SELECT
Brand,
ROUND(SUM(Current_price),2) AS Revenue
FROM fashion_sales
GROUP BY Brand
ORDER BY Revenue DESC;

SELECT
Season,
COUNT(*) AS Total_Orders
FROM fashion_sales
GROUP BY Season
ORDER BY Total_Orders DESC;

SELECT
Purchase_month,
ROUND(SUM(Current_price),2) AS Revenue
FROM fashion_sales
GROUP BY Purchase_month
ORDER BY STR_TO_DATE(Purchase_month,'%M');

SELECT
Price_category,
COUNT(*) AS Products
FROM fashion_sales
GROUP BY Price_category;

SELECT
Brand,
ROUND(AVG(Current_price),2) AS Avg_Price
FROM fashion_sales
GROUP BY Brand
ORDER BY Avg_Price DESC;

SELECT
Category,
SUM(Current_price) AS Revenue
FROM fashion_sales
GROUP BY Category
HAVING Revenue > 5000;

SELECT *
FROM fashion_sales
WHERE Current_price >
(
SELECT AVG(Current_price)
FROM fashion_sales
);

CREATE VIEW Brand_Revenue AS
SELECT
Brand,
SUM(Current_price) AS Revenue
FROM fashion_sales
GROUP BY Brand;

SELECT *
FROM Brand_Revenue;

SELECT *
FROM fashion_sales
ORDER BY Discount_amount DESC
LIMIT 1;

SELECT
Brand,
SUM(Current_price) AS Revenue
FROM fashion_sales
GROUP BY Brand
ORDER BY Revenue DESC
LIMIT 5;

SELECT
Color,
COUNT(*) AS Product_Count
FROM fashion_sales
GROUP BY Color
ORDER BY Product_Count DESC;

SELECT
Season,
ROUND(AVG(Current_price),2) AS Avg_Price
FROM fashion_sales
GROUP BY Season;

SELECT
Purchase_month,
SUM(Current_price) AS Revenue
FROM fashion_sales
GROUP BY Purchase_month;

SELECT
Product_ID,
Brand,
Current_price,
RANK() OVER (ORDER BY Current_price DESC) AS Price_Rank
FROM fashion_sales;

SELECT
Category,
Product_ID,
Current_price,
DENSE_RANK() OVER(
PARTITION BY Category
ORDER BY Current_price DESC
) AS Rank_In_Category
FROM fashion_sales;