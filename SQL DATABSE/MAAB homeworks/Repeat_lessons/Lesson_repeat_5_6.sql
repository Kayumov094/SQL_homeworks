create database lesson_repeat
use lesson_repeat
--Easy-Level Tasks
--Write a query that uses an alias to rename the ProductName column as Name in the Products table.

--Write a query that uses an alias to rename the Customers table as Client for easier reference.
SELECT * FROM Customerss AS Client

--Use UNION to combine results from two queries that select ProductName from Products
--and ProductName from Products_Discounted.
select ProductName
from Products
Union
select ProductName
from Products_Discounted
--Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
select * from Products 
Intersect
select * from Products_Discounted
--Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
SELECT DISTINCT FirstName, Country  from Customerss
--Write a query that uses CASE to create a conditional column
--that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
select * from Products 
SELECT *,
	CASE 
		when Price > 1000 then 'High'
		when Price <= 1000 then 'Low'
		end as Price_status
FROM Products
--Use IIF to create a column that shows 'Yes' if StockQuantity > 100, 
--and 'No' otherwise (Products_Discounted table, StockQuantity column).
select * from Products_Discounted
SELECT *,
	IIF(StockQuantity > 100, 'Yes', 'No') as Quantity_Status
FROM Products_Discounted;
 

-- Medium-Level Tasks
--Use UNION to combine results from two queries that select ProductName from Products and
--ProductName from Products_Discounted tables.
SELECT ProductName 
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted

--Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
SELECT * 
FROM Products 
except
select * 
from Products_Discounted;


--Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000,
--and 'Affordable' if less, from Products table.
SELECT *,
	CASE 
		when price > 1000 then 'Expensive'
		when price < = 1000 then 'Affordable'
		end as Price_Status
FROM Products
--Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
SELECT * FROM Employees
WHERE age <25 or Salary >60000;

--Update the salary of an employee based on their department,
--increase by 10% if they work in 'HR' or EmployeeID = 5
 
Update employees 
set Salary =Salary + Salary*0.1
where DepartmentName = 'HR' or EmployeeID = 5 


--Sotish summasi > 500 boʻlsa, “Yuqori daraja”, agar sotuv summasi 200 dan 500 gacha boʻlsa, “Oʻrta daraja” va aks holda “Past daraja”ni belgilash uchun
--CASE yordamida soʻrov yozing. (Savdo jadvalidan)
SELECT *,
	CASE
		when SaleAmount > 500 then 'High'
		when SaleAmount between 200 and 500 then 'Midle'
		else 'Low' end as SaleAmount_Status
FROM Sales;

--Buyurtma bergan, biroq Savdolar jadvalida tegishli yozuvga ega boʻlmagan mijozlarning identifikatorini topish uchun ISSOPT dan foydalaning.
select CustomerID from Orders
EXCEPT
select CustomerID from Sales

 
SELECT 
	CustomerID,
	Quantity,
	case 
	when Quantity = 1 then TotalAmount * 0.03
	when Quantity between 1 and 3 then TotalAmount * 0.05
	else TotalAmount * 0.07 end as Percentage_Discounted
FROM Orders;


--Write a query to find the minimum (MIN) price of a product in the Products table.
select Min(price) as MinPrice from Products;
--Write a query to find the maximum (MAX) Salary from the Employees table.
select max(salary) as MaxSalary from Employees
--Write a query to count the number of rows in the Customers table.
select count(CustomerID) as CountCustomers from Customerss
--Write a query to count the number of unique product categories from the Products table.
select  count(Distinct Category) as DistinctCategory from Products
--Write a query to find the total sales amount for the product with id 7 in the Sales table.
select * from Sales
select sum(SaleAmount) as Total_Sale_Amount
from Sales
where ProductID = 7
--Write a query to calculate the average age of employees in the Employees table.
select * from Employees
select avg(age) as AvgAge
from Employees

--Write a query to count the number of employees in each department.
select * from Employees
select 
	DepartmentName,
	count(EmployeeID) as CountDepartments
from Employees
group by DepartmentName 

--Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
select * from Products
select 
	Category,
	min(Price) as MinPrice,
	max(Price) as MaxPrice
from Products
group by Category
--Write a query to calculate the total sales per Customer in the Sales table.
select * from Sales 
SELECT 
	CustomerID,
	sum(SaleAmount)
FROM Sales
GROUP BY CustomerID;

--Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).

select * from Employees
select
	DepartmentName,
	count(employeeID) as Count_Employee
	from Employees
	group by DepartmentName
	having count(employeeID) > 5 
	

--Write a query to calculate the total sales and average sales for each product category from the Sales table.
select * from Sales
select 
	ProductID,
	sum(SaleAmount) as TotalSales,
	avg(SaleAmount) as AvgSales
from Sales
group by ProductID

 
--Write a query to count the number of employees from the Department HR.
select 
count(EmployeeID) as Count_Department
from Employees
where departmentName = 'HR';

--Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).
select * from Employees
SELECT DepartmentName,
	min(Salary) as HighestSalary,
	max(Salary) AS LowestSalary
FROM Employees
GROUP BY DepartmentName 
--Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).
select 
	DepartmentName,
	avg(Salary) as AvgSalary
from Employees
group by DepartmentName
--Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).
SELECT 
	DepartmentName,
	avg(Salary) as AvgSalary,
	count(*) as CountedRows
FROM Employees
group by DepartmentName;

--Write a query to filter product categories with an average price greater than 400.
select * from Products 
select 
	Category,
	avg(price) as AvgPrice
from Products
group by Category
having avg(price) > 400

--Write a query that calculates the total sales for each year in the Sales table.
select * from sales
SELECT Year(Saledate) as YEARS,
	sum(SaleAmount) as TotalAmount
FROM Sales
GROUP BY year(SaleDate)
--Write a query to show the list of customers who placed at least 3 orders.
 
SELECT 
	CustomerID,
	count(OrderID) as CountOrder
FROM Orders
GROUP BY CustomerID
HAVING count(OrderID) >= 3

--Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you don't have DeptName).
SELECT * 
FROM Employees

SELECT 
	DepartmentName,
	avg(Salary)
FROM Employees
GROUP BY DepartmentName
HAVING avg(salary) > 60000;


-- Hard-Level Tasks (6)
--Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.
select * from Products
select Category,
	avg(Price) as AvgPrice
from Products 
group by Category
having  avg(Price) > 150
--Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.
select * from Sales
SELECT 
	CustomerID,
	sum(SaleAmount) as TotalAmount
FROM Sales 
GROUP BY CustomerID
HAVING sum(SaleAmount) > 1500;
--Write a query to find the total and average salary of employees in each department, 
--and filter the output to include only departments with an average salary greater than 65000.
select * from Employees
SELECT 
	DepartmentName,
	sum(Salary),
	avg(salary)
FROM Employees
GROUP BY DepartmentName 
HAVING avg(salary) >65000;

--Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases.
--(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).
 
 SELECT 
    CustomerID,
    SUM(Freight) AS TotalAmount,
    MIN(Freight) AS Least_Purchases
FROM TSQL2012.Sales.Orders
WHERE Freight > 50
GROUP BY CustomerID;


--Write a query that calculates the total sales and counts unique products sold in each month of each year, 
--and then filter the months with at least 2 products sold.(Orders)
 

select * from Sales
select 
	sum(SaleAmount) as TotalAmount,
	count(Distinct ProductID) as UniqueProducts,
	year(SaleDate) as ByYear,
	month(Saledate) as ByMonth
from Sales 
group by year(SaleDate), month(SaleDate)
having Count(Distinct ProductID) >=2


--Write a query to find the MIN and MAX order quantity per Year. From orders table. Necessary tables:
select * from Orders
select 
	min(quantity) as MinQuantity,
	max(Quantity) as MaxQuantity,
	year(OrderDate) as ByYear
from Orders
group by year(OrderDate)
