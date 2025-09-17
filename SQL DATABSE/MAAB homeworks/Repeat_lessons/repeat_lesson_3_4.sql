-- Easy level Lesson-3

--1.Define and explain the purpose of BULK INSERT in SQL Server.
--SQL Serverda BULK INSERT maqsadini aniqlang va tushuntiring.
/* BULK INSERT bu tashqi file SQL serverga olib kelish kopiya qilgan holda 
avval database da table ni create qilib olamiz ustunlari va Datatype larin mos bo'lishi kerak 
bulk insert family_table 
from 'path_file'
with (
	fieldterminator = ',', 
	rowterminator = '\n',
	firstrow = 2
	);*/

--2.List four file formats that can be imported into SQL Server.
--.csv; .txt; .xls. .xml
--Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
create table Products(
ProductID int PRIMARY KEY,
ProductName VARCHAR(50),
Price DECIMAL (10,2)
);
select * from Products
Alter table Products 
add Constraint P_unique UNIQUE (ProductID);
--Insert three records into the Products table using INSERT INTO.
--Explain the difference between NULL and NOT NULL.
--Add a UNIQUE constraint to the ProductName column in the Products table.
--Write a comment in a SQL query explaining its purpose.
--Add CategoryID column to the Products table.
alter table Products 
add  constraint cat_un UNIQUE (CategoryID)
select * from Products
--.Medium-Level Tasks (10)
--Use BULK INSERT to import data from a text file into the Products table.
--Matn faylidan maʼlumotlarni Mahsulotlar jadvaliga import qilish uchun BULK INSERT dan foydalaning.

bulk insert matn_table 
from 'C/data/matn.txt'
with(
	fieldterminator = ',',
	rowterminator = '\n',
	firstrow = 2
	);

--Create a FOREIGN KEY in the Products table that references the Categories table.
create table Products (
productID int
productName VARCHAR(50),
CategoryID int
Constraint PK_PR PRIMARY KEY (ProductID),
Constraint FK_PK Foreign key (CategoryID) REFERENCES Categories(CategoryID)

--Explain the differences between PRIMARY KEY and UNIQUE KEY.
--Add a CHECK constraint to the Products table ensuring Price > 0.
alter table Products 
add constraint Check_PK CHECK (Price>0)
--Modify the Products table to add a column Stock (INT, NOT NULL).
alter table Products
add Stock int Not NULL DEFAULT 0\
select * from Products
--Use the ISNULL function to replace NULL values in Price column with a 0.

select 
	isnull(Price, 0) as Isnull_Price
	from Products
--	 Hard-Level Tasks (10)
--Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
create table Customers (
CustomerID int,
name Varchar(50),
lastName VARCHAR(50),
Age int,
ProductID int,
constraint PK_Customers PRIMARY KEY (CustomerID),
constraint FK_Customers_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
constraint Check_Customers Check (Age>=18)
);

--Create a table with an IDENTITY column starting at 100 and incrementing by 10.
create table nums (
id int identity (100,10),
nums int
);
--Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
create table OrderDetails (
id int,
name VARCHAR(50),
Amount int,
Constraint PK_OrderDetails Primary KEY (id, Amount)
);
--Explain the use of COALESCE and ISNULL functions for handling NULL values.
--Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
create table Employees (
id int identity (100,10),
name VARCHAR(50),
Age int,
Email VARCHAR(50),
ProductID int,
constraint PK_Employees PRIMARY KEY (id),
constraint Un_Employees UNIQUE (Email),
Constraint Ch_Employees Check (Age>18),
Constraint FK_Products_Employees FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE 
);
 --Lsson-4 
--  Easy-Level Tasks (10)
--Write a query to select the top 5 employees from the Employees table.
select TOP 5 * from Employees
--Use SELECT DISTINCT to select unique Category values from the Products table.
select distinct Category  from Products 
--Write a query that filters the Products table to show products with Price > 100.
select * from Products 
where price >100
--Write a query to select all Customers whose FirstName start with 'A' using the LIKE operator.
select * from Customers 
where FirstName LIKE 'A%';
--Order the results of a Products table by Price in ascending order.
select * from Products 
Order by Price ASC;
--Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and DepartmentName = 'HR'.
select * from Employees 
where Salary >=6000 and DepartmentName = 'HR';
--Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
select 
	id,
	name,
	isnull( email, 'noemail@example.com') as Email 
from Employees
--Write a query that shows all products with Price BETWEEN 50 AND 100.
Select * from Products 
where price between 50 and 100;
--Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
select distinct Category, ProductName 
from Products
--After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.
select distinct Category, ProductName 
from Products
Order by ProductName 
 
---- --MEDIUM LEVEL
--Write a query to select the top 10 products from the Products table, ordered by Price DESC.
select TOP 10 * from Products 
Order by Price DESC;
--Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
select 
	Coalesce(FirstName, LastName, 'non')
	from Employees;
--Write a query that selects distinct Category and Price from the Products table.
select distinct Category, Price 
from Products;
--Write a query that filters the Employees table to show employees whose
--Age is either between 30 and 40 or DepartmentName = 'Marketing'.
select * from employees
where age between 30 and 40 or Department = 'Marketing'
--Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
select * from Employees 
order by salary DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;
--Write a query to display all products with Price <= 1000 and StockQuantity > 50, sorted by Stock in ascending order.
select * from Products 
where Price <= 1000 and StockQuantity >50
Order by StockQuantity ASC

--Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
select * from Products 
where ProductName LIKE '%e%';

--Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
select * from Employees 
where Department in ('HR', 'IT','Finance')
--Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.
--Use customers table
select * from Customers
Order by City ASC, PostalCode DESC
   
--   Hard-Level Tasks
--Write a query that selects the top 5 products with the highest sales, using TOP(5) and ordered by SaleAmount DESC.
SELECT TOP 5 * from Sales
Order by SaleAmount DESC;
--Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)
select *, 
	case 
		when FirstName is not NULL  and LastName IS not NULL Then firstName +' ' +Lastname 
		when Firstname is not NULL and LastName is NULL THEN Firstname 
		when FirstName is NULL and LastName Is not NULL Then LastName 
		else 'Notname' end as Fullname 
from Employees
--Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50,
--using DISTINCT on three columns.
select Distinct Category, ProductName, Price
from Products 
where price > 50
--Write a query that selects products whose Price is less than 10% of the average price in the Products table.
--(Do some research on how to find average price of all products)
select * from Products
 select ProductID,
 ProductName,
 Price from Products
 where price < 0.1* (select AVG(price) from Products)
  
--Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
select * from Employees 
where Age <30 and DepartmentName in ('HR', 'IT')

--Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
select * from Customers 
where Email Like '%@gmail.com'
--Write a query that uses the ALL operator to find employees 
--whose salary is greater than all employees in the 'Sales' department.
select * from Employees
where DepartmentName = 'Sales'
select EmployeeID,
	FirstName,
	salary 
	from Employees
	where salary > ALL (select Salary from Employees where DepartmentName = 'Sales')
--Write a query that filters the Orders table for orders placed in the last 180 days using BETWEEN and LATEST_DATE in the table. (Search how to get the current date and latest date)
select OrderID,
OrderDate
 from Orders
where OrderDate BETWEEN DATEADD(DAY, -180, Getdate()) and GetDate();
 