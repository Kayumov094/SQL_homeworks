sp_tables

--Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, 
--along with their department names.
--Expected Columns: EmployeeName, Salary, DepartmentName
select
	e.Name as EmployeeName,
	e.Salary,
	d.DepartmentName 
from Employees as e
join Departments as d 
on e.DepartmentID = d.DepartmentID
where Salary > 50000
 
--Using the Customers and Orders tables, write a query to display customer names and 
--order dates for orders placed in the year 2023.
--Expected Columns: FirstName, LastName, OrderDate
select * from Customers
select * from Orders
select 
	c.Firstname,
	c.LastName,
	o.OrderDate
from Customers as c
inner join ORders as o
	on c.CustomerID = o.CustomerID
where year(o.OrderDate) = 2023

--Using the Employees and Departments tables, write a query to show all employees along with their department names. 
--Include employees who do not belong to any department.
--Expected Columns: EmployeeName, DepartmentName
select * from Employees
select * from Departments
SELECT 
	e.Name as EmployeeName,
	d.DepartmentName
FROM Employees as e 
LEFT JOIN Departments as d
	ON e.DepartmentID = d.DepartmentID


--Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply.
--Show suppliers even if they don’t supply any product.
-- Expected Columns: SupplierName, ProductName
 
SELECT 
	s.SupplierName,
	p.ProductName 
FROM Suppliers as s 
LEFT JOIN Products as p
	on s.SupplierID = p.SupplierID

--Using the Orders and Payments tables, write a query to return all orders and their corresponding payments.
--Include orders without payments and payments not linked to any order.
-- Expected Columns: OrderID, OrderDate, PaymentDate, Amount
select * from Orders 
select * from Payments

select 
	o.OrderID,
	o.OrderDate,
	p.PaymentDate,
	p.Amount
from Orders as o
full outer  join Payments as p
	on o.OrderID = p.OrderID
	   	  
--Using the Employees table, write a query to show each employee's name along with the name of their manager.
-- Expected Columns: EmployeeName, ManagerName
select * from Employees
select
	e1.Name as EmployeeName,
	e2.Name as ManagerName
from Employees as e1 
join Employees as e2
on e1.ManagerID = e2.EmployeeID


--Using the Students, Courses, and Enrollments tables, write a query to list the names of students 
--who are enrolled in the course named 'Math 101'.
--Expected Columns: StudentName, CourseName
select * from  Students
select * from Courses
select * from Enrollments
SELECT 
	s.Name as StudentName,
	c.CourseName as CourseName 
FROM Students as s
JOIN Enrollments as e
	on s.StudentID = e.StudentID
JOIN Courses as c
	on e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101'

--Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items.
--Return their name and the quantity they ordered.
-- Expected Columns: FirstName, LastName, Quantity
select * from Customers 
select * from Orders
SELECT 
	c.FirstName,
	c.LastName,
	o.Quantity
FROM Customers as c
JOIN Orders as o
	on c.CustomerID = o.CustomerID
WHERE o.Quantity > 3

--Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
--Expected Columns: EmployeeName, DepartmentName
 
SELECT 
	e.Name as EmployeeName,
	d.DepartmentName 
FROM Employees as e
JOIN Departments as d
	on e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources'; 

--Medium-Level Tasks (9)
--Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
--Expected Columns: DepartmentName, EmployeeCount
 
SELECT 
	d.DepartmentName,
	count(EmployeeID) as EmployeeCount
FROM Employees as e
JOIN Departments as d
	on e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentName
HAVING count(EmployeeID) >5


--Using the Products and Sales tables, write a query to find products that have never been sold.
--Expected Columns: ProductID, ProductName
select * from Products 
select * from Sales 
select 
	p.ProductID,
	p.ProductName 
from Products as p
left Join Sales as s
	on p.ProductID = s.ProductID
where s.ProductID is NULL


--Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
--Expected Columns: FirstName, LastName, TotalOrders
select * from Customers
select * from Orders
select
	c.FirstName,
	c.LastName,
	count(OrderID) as TotalOrders
from Customers as c
join orders as o
	on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName 
having count(OrderID) >=1

--Using the Employees and Departments tables, write a query to show only those records where both employee and 
--department exist (no NULLs).
-- Expected Columns: EmployeeName, DepartmentName
select * from Employees 
select * from Departments
select 
	e.Name as EmployeeName,
	d.DepartmentName
from Employees as e
join Departments as d
	on e.DepartmentID  = d.DepartmentID

--Using the Employees table, write a query to find pairs of employees who report to the same manager.
-- Expected Columns: Employee1, Employee2, ManagerID
select * from Employees 
select 
	e1.Name as Employee1,
	m.Name as Employee2,
	m.ManagerID
	from Employees as e1
	join Employees as m
	on e1.ManagerID = m.ManagerID
	and  e1.EmployeeID <m.EmployeeID
 

--Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
--Expected Columns: OrderID, OrderDate, FirstName, LastName
select * from Orders
select * from Customers

select 
	o.OrderID,
	o.OrderDate,
	c.FirstName,
	c.LastName
from Orders as o 
join Customers as c
	on o.CustomerID = c.CustomerID
where year(o.OrderDate) = 2022

--Using the Employees and Departments tables, write a query to return employees from the 'Sales' department 
--whose salary is above 60000.
-- Expected Columns: EmployeeName, Salary, DepartmentName
select * from Employees 
select * from Departments
select 
	e.Name as EmployeeName,
	e.Salary as EmployeeSalary,
	d.DepartmentName 
from Employees as e
join Departments as d 
	on e.DepartmentID = d.DepartmentID 
where d.DepartmentName  = 'Sales' and e.Salary > 60000

--Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
--Expected Columns: OrderID, OrderDate, PaymentDate, Amount
select * from Orders 
select * from Payments
select 
	o.OrderID,
	o.OrderDate,
	p.PaymentDate,
	p.Amount
from Orders o
inner join Payments as p
	on o.OrderID = p.OrderID

--Using the Products and Orders tables, write a query to find products that were never ordered.
-- Expected Columns: ProductID, ProductName
select * from Products 
select * from Orders
select
	p.ProductID,
	p.ProductName
from Products as p
left join Orders as o
	on p.ProductID = o.ProductID
where o.OrderID is NULL


--Hard-Level Tasks (9)
--Using the Employees table, write a query to find employees whose salary is greater 
--than the average salary in their own departments.
-- Expected Columns: EmployeeName, Salary
select * from Employees
select 
	Name as EmployeeName,
	salary as EmployeeSalary,
	DepartmentID
from Employees as e1 
where salary >  (
	select avg(salary)  
	from Employees as e2
	where e1.DepartmentID = e2.DepartmentID
	) 
--Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
-- Expected Columns: OrderID, OrderDate
select * from Orders 
select * from Payments
select 
	o.OrderID,
	o.OrderDate
from Orders as o
left join Payments as p
	on o.OrderID = p.OrderID 
where year( o.OrderDate) < 2020 and 
p.OrderID is NULL




--Using the Products and Categories tables, write a query to return products that do not have a matching category.
-- Expected Columns: ProductID, ProductName
select * from Products 
select * from Categories
select 
	p.ProductID,
	p.ProductName 
from Products as p
LEFT join Categories as c
	 on p.Category = c.CategoryID
where c.CategoryID is NULL



--Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
-- Expected Columns: Employee1, Employee2, ManagerID, Salary

select * from Employees
select 
	e1.Name as Employee1,
	e2.Name as Employee2,
	e1.ManagerID,
	e1.Salary as EmployeeSalary1,
	e2.Salary as EmployeeSalary2
	from Employees as e1
	join Employees as e2
		on e1.ManagerID = e2.ManagerID
and e1.EmployeeID < e2.EmployeeID
where e1.salary > 60000 and e2.Salary> 60000
 

--Using the Employees and Departments tables,
--write a query to return employees who work in departments which name starts with the letter 'M'.
-- Expected Columns: EmployeeName, DepartmentName
SELECT * FROM eMPLOYEES 
Select * from Departments
select 
	e.Name as EmployeeName,
	d.DepartmentName 
	from Employees as e
	inner join Departments as d 
		on e.DepartmentID = d.DepartmentID
		where e.Name  LIKE 'M%'
			   
--Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
--Expected Columns: SaleID, ProductName, SaleAmount
select * from Products 
select * from Sales 
select 
	s.SaleID,
	p.ProductName, 
	s.SaleAmount
from Sales as s 
inner join Products as p
	on s.ProductID = p.ProductID 
	where s.Saleamount > 500

	   	 
--Using the Students, Courses, and Enrollments tables, 
--write a query to find students who have not enrolled in the course 'Math 101'.
-- Expected Columns: StudentID, StudentName
select  * from Students 
select * from Enrollments
select * from Courses 
select 
	s.StudentID,
	s.Name as StudentName 
	from Students as s
	left Join Enrollments as e
	on s.StudentID = e.StudentID
	left join courses as c
	on e.CourseID = c.CourseID and c.CourseName  = 'Math 101'
	where c.CourseID is NULL

	
--Using the Orders and Payments tables, write a query to return orders that are missing payment details.
-- Expected Columns: OrderID, OrderDate, PaymentID
select * from Orders 
select * from Payments 
select 
	o.OrderID,
	o.OrderDate,
	p.PaymentID
from Orders as o
left join Payments as p
	on o.OrderID = p.OrderID
where p.PaymentID is NULL

--Using the Products and Categories tables, 
--write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
-- Expected Columns: ProductID, ProductName, CategoryName
select * from Products 
select * from Categories
select 
	p.ProductID,
	p.ProductName,
	c.CategoryName 
from Products as p
join Categories as c
	on p.Category = c.CategoryID
where c.CategoryName  = 'Electronics'
	or c.CategoryName  = 'Furniture'
