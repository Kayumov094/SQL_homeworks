--Using Products table, find the total number of products available in each category.
 
SELECT 
	Category,
	count(ProductID) as CountProducts
FROM Products
GROUP BY Category
--Using Products table, get the average price of products in the 'Electronics' category.
 
SELECT 
	avg(price) as AvgPrice
FROM Products
WHERE category = 'Electronics'
--Using Customers table, list all customers from cities that start with 'L'.
SELECT * 
FROM Customers
WHERE city LIKE 'L%';
--Using Products table, get all product names that end with 'er'.
SELECT *
FROM Products
WHERE ProductName Like '%er';
--Using Customers table, list all customers from countries ending in 'A'.
SELECT * 
FROM Customers
WHERE country LIKE '%A';

--Using Products table, show the highest price among all products.
SELECT 
	max(price) as MaxPrice 
FROM Products
--Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
SELECT * FROM Products
select *,
	IIF(StockQuantity <30, 'Low Stock', 'Sufficient')
from Products
--Using Customers table, find the total number of customers in each country.
select * from Customers
select
	Country,
	Count(CustomerID) as NumberOfCustomers
from Customers
group by Country

--Using Orders table, find the minimum and maximum quantity ordered.
select * from Orders
select 
	min(Quantity) as MinQuantity,
	max(Quantity) as MaxQuantity
from Orders


--Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
select * from Orders
select * from Invoices
SELECT 
	o.CustomerID,
	year(o.OrderDate) as ByYear,
	month(o.OrderDate) as ByMonth
FROM Orders as o
LEFT JOIN Invoices as i
	ON o.OrderID = i.InvoiceID
WHERE year(o.OrderDate)  = 2023 
	AND month(o.OrderDate) = 1 
	AND i.InvoiceID is null;

--Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
SELECT * 
FROM Products
UNION ALL
SELECT * 
FROM Products_Discounted;

--Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
SELECT * 
FROM Products 
UNION
SELECT * 
FROM Products_Discounted
--Using Orders table, find the average order amount by year.
SELECT 
	avg(TotalAmount) as AvgAmount,
	year(OrderDate) as ByYear
FROM Orders
GROUP BY year(OrderDate)
--Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
SELECT 
	ProductName,
	IIF(Price < 100, 'Low', IIF(Price between 100 and 500, 'Mid', IIF(Price > 500, 'High', 'Unknown' ))) as PriceGroup
FROM Products;
--Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
 select * from City_Population
 select 
	District_name,
	[2012],
	[2013]
	Into Pivot_table
from City_Population
PIVOT
(
sum(population) for year in ([2012], [2013])
) as p;
select * from Pivot_table

select 
	district_name,
	Yil,
	Aholi
from Pivot_table
unpivot
(
aholi for yil in ([2012],[2013])
) as unp;

--Using Sales table, find total sales per product Id.
select * from Sales
select 
	ProductID,
	sum(SaleAmount) as TotalSales
from Sales 
group by ProductID
--Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
select * from Products
select ProductName
from Products
where ProductName LIKE '%oo%'




--Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
 
SELECT TOP 3 
	CustomerID,
	sum(TotalAmount) as TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY sum(TotalAmount)
	
--Transform Population_Each_Year table to its original format (City_Population).
select * from City_population
select 
	district_name,
	[2012],
	[2013]
into Population_each_year
from city_population
pivot(
sum(population) for year in ([2012], [2013])
) as pt

select * from Population_each_year
select * from City_population
select 
	 district_name,
	population,
	year
from population_each_year
unpivot (
population for year in ([2012], [2013])
) as un_pivot;

--Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
select * from Products 
select * from  Sales
select 
	ProductName, 
	count(SaleID)
from Products as p
inner join Sales as s
on p.ProductID = s.ProductID 
group by ProductName


--Transform Population_Each_City table to its original format (City_Population).
select * from City_population
select 
	district_id,
	district_name,
	[2012],
	[2013]
into Population_each_City
from City_population
pivot
(
sum(population) for year in ([2012], [2013])
) as pt

select * from population_each_city

select 
	district_id,
	district_name,
	year,
	population
from population_each_city
unpivot(
population for year in ([2012],[2013])
) as unpt
