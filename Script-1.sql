--Find the maximum Quantity Sold in a transaction 

SELECT MAX(Quantity), 
COUNT(*)  
FROM Order_details

--Find the unique products in All Transactions 
SELECT DISTINCT 
ProductID 
FROM Order_details od; 

--Did each of the unique product sold at Quantity  Of 3

SELECT  DISTINCT 
ProductID, Quantity 
FROM Order_details od 
WHERE Quantity = 3
ORDER BY ProductID  ASC, Quantity DESC;  

--Find the unique  Properties
SELECT DISTINCT 
PropertyID 
FROM Order_details od 

--Find the product Category that has maximum products 

SELECT ProductCategory, COUNT(ProductCategory)   
FROM Product_details pd
GROUP BY   ProductCategory
ORDER BY 2 DESC; 


--Find the most state where stores are present

SELECT PropertyState,  COUNT(PropertyState)  
FROM Property_details pd
GROUP BY PropertyState
ORDER BY 2 DESC;

--Find the most top 5 product IDs that did the maximum sales in terms of quantity
SELECT ProductID,
sum(Quantity)  as Total_Quantity   
FROM  Order_details od 
GROUP BY ProductID 
ORDER BY 2 DESC 
limit 5;

--Find the top 5 property ID's that did maximum quantity 
SELECT PropertyID, SUM(Quantity)
FROM Order_details od 
GROUP BY PropertyID
ORDER BY 2 DESC 
LIMIT 5;

--JOINS and Group By--

--Find the top 5 product names that did the maximum sales in terms of quantity 
SELECT a.*
, b.ProductName ,b.ProductCategory ,b.Price 
FROM Order_details as a
left join Product_details as b on b.ProductID=a.ProductID 



SELECT 
b.ProductName, 
sum(a.Quantity) as Total_Quantity  
FROM Order_details as a
left join Product_details as b on b.ProductID =a.ProductID 
GROUP BY b.ProductName  
ORDER BY 2 DESC 

--Find the top 5 Products that did Maximum Sales
SELECT 
b.ProductName, 
sum(a.Quantity*b.Price) as sales  
FROM Order_details as a
left join Product_details as b on b.ProductID =a.ProductID 
GROUP BY b.ProductName  
ORDER BY 2 DESC 
LIMIT 5;

--Find the top 5 cities (stores)  that did Maximum Sales
SELECT  
c.PropertyCity, SUM(a.Quantity*b.price)  
FROM Order_details as a
left join Product_details as b on b.ProductID =a.ProductID 
LEFT JOIN Property_details as c on a.PropertyID =c.'Prop ID'
GROUP BY c.PropertyCity  
ORDER BY 2 DESC
LIMIT 5;

--Find the top 5 products in Each of the Cities (Arlington,Atlanta and Boston)
SELECT  
c.PropertyCity, b.ProductName, SUM(a.Quantity*b.price) as Sales 
FROM Order_details as a
left join Product_details as b on b.ProductID =a.ProductID 
LEFT JOIN Property_details as c on a.PropertyID =c.'Prop ID'
WHERE c.PropertyCity = 'Arlington'
GROUP BY c.PropertyCity, b.ProductName  
ORDER BY Sales DESC
LIMIT 5;

SELECT  
c.PropertyCity, b.ProductName, SUM(a.Quantity*b.price) as Sales 
FROM Order_details as a
left join Product_details as b on b.ProductID =a.ProductID 
LEFT JOIN Property_details as c on a.PropertyID =c.'Prop ID'
WHERE c.PropertyCity = 'Atlanta'
GROUP BY c.PropertyCity, b.ProductName  
ORDER BY Sales DESC
LIMIT 5;

SELECT  
c.PropertyCity, b.ProductName, SUM(a.Quantity*b.price) as Sales 
FROM Order_details as a
left join Product_details as b on b.ProductID =a.ProductID 
LEFT JOIN Property_details as c on a.PropertyID =c.'Prop ID'
WHERE c.PropertyCity = 'Boston'
GROUP BY c.PropertyCity, b.ProductName  
ORDER BY Sales DESC
LIMIT 5;

