--Easy (10 puzzles)

--Using Products, Suppliers table List all combinations of product names and supplier names.
select * from Products
select * from Suppliers
select * from Products 
cross join Suppliers
--Using Departments, Employees table Get all combinations of departments and employees.
select * from Departments 
cross join Employees
--Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
select  
	s.SupplierName,
	p.ProductName from Suppliers as s
inner join Products as p
	on s.SupplierID = p.SupplierID
 
--Using Orders, Customers table List customer names and their orders ID.
select * from Customers
select * from Orders
select 
	c.FirstName as CustomerName,
	o.OrderID as Customer_OrderID
	from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID

--Using Courses, Students table Get all combinations of students and courses.
select * from Courses
cross join Students;

--Using Products, Orders table Get product names and orders where product IDs match.
select * from Products 
select * from Orders
SELECT p.ProductName,
	o.OrderID,
	o.OrderDate,
	o.CustomerID
FROM Products as p
INNER JOIN Orders as o 
	on p.ProductID = o.ProductID

--Using Departments, Employees table List employees whose DepartmentID matches the department.
 
SELECT 
	e.EmployeeID,
	e.Name as EmployeeName,
	d.DepartmentName 
FROM Employees as e
INNER JOIN Departments as d
	on d.DepartmentID = e.DepartmentID;

	
--Using Students, Enrollments table List student names and their enrolled course IDs.
select * from Students
select * from Enrollments
select * from Courses

select 
	s.Name as Students,
	e.CourseID
from Students as s
inner join Enrollments as e
on s.StudentID = e.StudentID

--Using Payments, Orders table List all orders that have matching payments.
select * from Payments
select * from Orders
SELECT 
	o.OrderID,
	o.CustomerID,
	o.OrderDate,
	o.Quantity,
	o.TotalAmount,
	p.PaymentDate
FROM orders as o
INNER JOIN Payments as p
	on o.OrderID = p.OrderID

--Using Orders, Products table Show orders where product price is more than 100.
select * from Orders
select * from Products 
select 
	o.OrderID,
	p.ProductName,
	p.price,
	o.OrderDate,
	o.Quantity,
	o.TotalAmount
from Orders as o 
inner join Products as p
on o.ProductID = p.ProductID
where p.Price > 100

-- Medium (10 puzzles)
--Using Employees, Departments table List employee names and department names where department IDs are not equal. 
--It means: Show all mismatched employee-department combinations.

select * from Employees 
select * from Departments
SELECT 
	e.Name as EmployeeName,
	d.DepartmentName 
FROM Employee as e 
Cross JOIN Departments as d
WHERE e.departmentID != d.departmentID

--Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
select * from Orders
select * from Products
select 
	o.OrderID,
	o.OrderDate,
	o.Quantity,
	p.ProductName,
	p.StockQuantity
from Orders as o
inner join Products as p
	on o.ProductID = p.ProductID
where o.quantity > p.Stockquantity

--Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
select * from Customers
select * from Sales
select 
	c.FirstName as CustomerName,
	s.ProductID,
	s.SaleAmount 
from Customers as c
inner join Sales as s 
	on c.CustomerID = s.CustomerID
where s.SaleAmount >=500

--Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
select * from Courses
select * from Enrollments
select * from Students 
select 
	s.Name as StudentName,
	c.CourseName,
	e.EnrollmentID
from Enrollments as e
inner join Students as s
	on e.StudentID = s.StudentID
inner join Courses as c
	on e.CourseID = c.CourseID

--Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
 
SELECT 
	p.ProductName,
	s.SupplierName 
FROM Products as p
inner join Suppliers as s 
	on p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%'

--Using Orders, Payments table Show orders where payment amount is less than total amount.
select * from Orders
select * from Payments
select 
	o.OrderID,
	o.OrderDate,
	o.TotalAmount,
	p.PaymentDate,
	p.Amount
from Orders as o
inner join Payments as p
	on o.OrderID = p.OrderID
	where o.TotalAmount > p.Amount
--Using Employees and Departments tables, get the Department Name for each employee.
select * from Employees
select * from Departments
select 
	e.Name as EmployeeName,
	d.DepartmentName
from Employees as e 
inner join Departments as d
	on e.DepartmentID = d.DepartmentID

--Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
select * from Products 
select * from Categories
select p.ProductName 
from Products as p
inner join Categories as c
	on p.Category = c.CategoryID
	where c.CategoryName in ('Electronics',  'Furniture')
--Using Sales, Customers table Show all sales from customers who are from 'USA'.
select * from Sales 
select * from Customers
select 
	s.SaleID,
	s.SaleDate,
	s.SaleAmount,
	c.Country
from Sales as s 
inner join Customers as c
	on s.CustomerID = c.CustomerID
where c.Country = 'USA'

--Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
select * from Orders
select * from Customers
select 
	o.OrderID,
	o.TotalAmount,
	c.Country,
	sum(Quantity) as OrderTotal
	from Orders as o 
	inner join Customers as c
	on o.CustomerID = c.CustomerID
	where c.Country = 'Germany'
	group by o.OrderID, o.TotalAmount, 	c.Country
	having sum(Quantity) > 100

--	 Hard (5 puzzles)(Do some research for the tasks below)
--Using Employees table List all pairs of employees from different departments.
select * from Employees

select
	em1.Name as Employee1,	
	em2.Name as Employee2
from Employees as em1
	cross join Employees as em2 
where em1.DepartmentID <> em2.DepartmentID
	and em1.EmployeeID < em2.EmployeeID
 
 --Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
select * from Payments
select * from Orders
select * from Products 
select 
	pp.PaymentID,
	pp.PaymentDate,
	pp.Amount,
	o.quantity * p.Price as Order_Amount
from Payments as pp
inner join Orders as o
	on pp.OrderID = o.OrderID
inner join Products as p
	on o.ProductID = p.ProductID
where pp.Amount <> (o.quantity * p.Price)
--Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
select * from Students
select * from Enrollments
select* from  Courses

select 
	s.Name as StudentName
from Students as s
left join Enrollments as e
on s.StudentID = e.StudentID
where e.EnrollmentID is NULL

--Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
--Xodimlar jadvalidan foydalanish Birovning menejeri bo'lgan, lekin maoshi ular boshqaradigan odamdan kam yoki unga teng bo'lgan xodimlarni ro'yxatlang.
select * from Employees
select 
	em1.Name as Employee1,
	em2.Name as Manager,
	em1.salary as EmpSalary,
	em2.salary as ManagerSalary
from Employees em1 
inner join Employees as em2
	on em1.ManagerID = em2.EmployeeID
where em2.Salary <= em1.Salary
--Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
select * from Orders
select * from Payments
select * from Customers
select 
	c.CustomerID,
	c.FirstName as CustomerName
from Customers as c
inner join Orders as o
	on c.customerID = o.CustomerID
left join Payments as p
	on o.OrderID = p.OrderID
where p.PaymentId is NULL