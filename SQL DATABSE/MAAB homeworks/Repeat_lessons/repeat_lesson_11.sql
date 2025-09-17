--🟢 Easy-Level Tasks (7)
--Return: OrderID, CustomerName, OrderDate
--Task: Show all orders placed after 2022 along with the names of the customers who placed them.
--Tables Used: Orders, Customers
sp_tables
select * from Orders
select * from Customers
select 
	o.OrderID,
	c.FirstName as CustomerName,
	o.OrderDate
from Orders as o
inner join Customers as c
	on o.CustomerID = c.CustomerID
	where year(o.OrderDate) = 2022
--Return: EmployeeName, DepartmentName
--Task: Display the names of employees who work in either the Sales or Marketing department.
--Tables Used: Employees, Departments
 
SELECT 
	e.Name as EmployeeName,
	d.DepartmentName
FROM Employees as e
INNER JOIN Departments as d
	on e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' or d.DepartmentName = 'Marketing';
--Return: DepartmentName, MaxSalary
--Task: Show the highest salary for each department.
--Tables Used: Departments, Employees
select * from Departments 
select * from Employees
SELECT 
	d.DepartmentName,
	max(Salary) as MaxSalary 
FROM Departments as d 
JOIN Employees as e
	on d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

--Return: CustomerName, OrderID, OrderDate
--Task: List all customers from the USA who placed orders in the year 2023.
--Tables Used: Customers, Orders
select * from Customers
select * from Orders
SELECT
	c.FirstName as CustomerName,
	o.OrderID,
	o.OrderDate 
FROM Customers as c
	join orders as o
		on c.CustomerID = o.CustomerID 
WHERE c.Country = 'USA' and year(o.OrderDate) = 2023;
--Return: CustomerName, TotalOrders
--Task: Show how many orders each customer has placed.
--Tables Used: Orders , Customers
select * from Orders
select * from Customers
SELECT 
	c.FirstName as CustomerName,
	count(o.OrderID) as TotalOrder
FROM Orders as o 
LEFT JOIN Customers as c
	on o.CustomerID = c.CustomerID
GROUP BY c.FirstName
--Return: ProductName, SupplierName
--Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
--Tables Used: Products, Suppliers
 
SELECT 
	p.ProductName,
	s.SupplierName
FROM Products as p
	join Suppliers as s
	on p.SupplierID = s.SupplierID
WHERE s.SupplierName = 'Gadget Supplies' or s.SupplierName = 'Clothing Mart'

--Return: CustomerName, MostRecentOrderDate
--Task: For each customer, show their most recent order. Include customers who haven't placed any orders.
--Tables Used: Customers, Orders
 
SELECT 
	c.FirstName as CustomerName,
	count(o.OrderID) as CountOrders,
	max(o.OrderDate) as MostRecentOrderDate 
FROM Customers as c
LEFT JOIN Orders as o
	on c.CustomerID = o.CustomerID
GROUP BY c.FirstName;



--Medium-Level Tasks (6)
--Return: CustomerName, OrderTotal
--Task: Show the customers who have placed an order where the total amount is greater than 500.
--Tables Used: Orders, Customers
select * from Orders
select * from Customers
select 
	c.FirstName as CustomerName,
	sum(o.totalAmount) as totalAmount
from Orders as o
join Customers as c
on o.CustomerID = c.CustomerID
group by c.FirstName 
having sum(o.TotalAmount) > 500

select 
	c.FirstName as CustomerName
	--sum(o.totalAmount) as totalAmount
from Orders as o
join Customers as c
on o.CustomerID = c.CustomerID
where o.TotalAmount > 500

--Return: ProductName, SaleDate, SaleAmount
--Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
--Tables Used: Products, Sales
 
SELECT 
	p.ProductName,
	s.SaleDate,
	s.SaleAmount
FROM Products as p
JOIN Sales as s
	on p.ProductID = s.ProductID
WHERE year(s.SaleDate) = 2022 or s.SaleAmount> 400;

--Return: ProductName, TotalSalesAmount
--Task: Display each product along with the total amount it has been sold for.
--Tables Used: Sales, Products
 
select 
	p.ProductName, 
	sum(s.SaleAmount) as TotalSalesAmount 
	from Sales as s
	join Products as p
		on s.ProductID = p.ProductID
	group by p.ProductName

--Return: EmployeeName, DepartmentName, Salary
--Task: Show the employees who work in the HR department and earn a salary greater than 60000.
--Tables Used: Employees, Departments

 SELECT 
	e.Name as EmployeeName,
	d.DepartmentName as departmentName,
	e.Salary as EmployeeSalary 
FROM Employees as e
join Departments as d
	on e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources'
	and e.Salary > 60000

--Return: ProductName, SaleDate, StockQuantity
--Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
--Tables Used: Products, Sales
SELECT * FROM Products 
SELECT * FROM Sales 
SELECT 
	p.ProductName as ProductName,
	s.SaleDate,
	p.StockQuantity
FROM Products as p
JOIN Sales as s
	on p.ProductID = s.ProductID
WHERE year(s.SaleDate) =2023 and p.StockQuantity > 100

--Return: EmployeeName, DepartmentName, HireDate
--Task: Show employees who either work in the Sales department or were hired after 2020.
--Tables Used: Employees, Departments
 
SELECT 
	e.Name as EmployeeName,
	d.DepartmentName,
	e.HireDate 
FROM Employees as e
	join Departments as d
	on e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName  = 'Sales'
	or year(e.HireDate) > 2020;


--	 Hard-Level Tasks (7)
--Return: CustomerName, OrderID, Address, OrderDate
--Task: List all orders made by customers in the USA whose address starts with 4 digits.
--Tables Used: Customers, Orders
 
SELECT 
	c.FirstName as CustomerName,
	o.OrderID,
	c.Address,
	o.OrderDate 
FROM Customers as c
	join Orders as o
	on c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' 
	and c.Address LIKE '[0-9][0-9][0-9][0-9]%';

--Return: ProductName, Category, SaleAmount
--Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
--Tables Used: Products, Sales
select * from Products 
select * from Sales 
select * from Categories
SELECT 
	p.ProductName,
	p.Category,
	s.SaleAmount
FROM Products as p
	join Sales as s
	on p.ProductID = s.ProductID
JOIN Categories as cc
	on p.Category = cc.CategoryID
WHERE cc.CategoryName = 'Electronics'
	or s.SaleAmount >350
 
--Return: CategoryName, ProductCount
--Task: Show the number of products available in each category.
--Tables Used: Products, Categories
 
SELECT 
	c.CategoryName,
	Count(p.ProductID) as ProductCount
FROM Categories as c
	join Products as p
	on c.CategoryID = p.Category
GROUP BY c.CategoryName



--Return: CustomerName, City, OrderID, Amount
--Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
--Tables Used: Customers, Orders
select * from Customers 
select * from Orders 
SELECT 
	c.FirstName as CustomerName,
	c.City as CustomerCity,
	o.OrderID as CustomerOrderID,
	o.TotalAmount as Amount 
FROM Customers as c
	JOIN Orders as o
	on c.CustomerID = o.CustomerID
WHERE c.City = 'Los Angeles'
	and o.TotalAmount > 300

--Return: EmployeeName, DepartmentName
--Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
--Tables Used: Employees, Departments
select * from Employees
select * from departments
select 
e.Name as EmployeeName,
d.DepartmentName 
from Employees as e
join Departments as d 
on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Human Resources' 
	or d.DepartmentName = 'Finance'
	or e.Name LIKE '%[a,i,o,u][a,i,o,e][a,i,u,e][a,o,u,e]%'

--Return: EmployeeName, DepartmentName, Salary
--Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
--Tables Used: Employees, Departments
select * from Employees 
select * from Departments
SELECT 
	e.Name as EmployeeName,
	d.DepartmentName, 
	e.Salary
FROM Employees as e
	join Departments as d
	on e.departmentID =d.DepartmentID 
WHERE d.DepartmentName = 'Sales'
	or (d.DepartmentName = 'Marketing'
	and e.Salary > 60000)