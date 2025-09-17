-- Define the following terms: data, database, relational database, and table.
--List five key features of SQL Server.
--What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
--Quyidagi atamalarni aniqlang: ma'lumotlar, ma'lumotlar bazasi, relyatsion ma'lumotlar bazasi va jadval.
 
--Easy 
--1. amalumot bu biror narsa yoki hodisa haqida axbrot
malumotlar bazasi deb malumotlar va ularga tegishli bolgan xususiyatlarni jamlanmasi, malumotlarni tartib bilan saqlangan holati
-- reletion database bu bir biriga boglangan jadvallardan iborat malumotlar ombori 
-- table bu qator va ustunalrdan iborat ma'lumotlardan iborat jadval 
/* SQL serverga ulanishning ikkita autentification bor 
birinchisi - Windows Autentification 
iikinchisi - SQL server Autentification */
--Create a new database in SSMS named SchoolDB.
--Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
--Describe the differences between SQL Server, SSMS, and SQL.
--1. CREATE DATABASE SchoolDB; 
/* CREATE TABLE Students (
			studentID int PRIMARY KEY,
			name VARCHAR (50),
			Age int, NOT NULL
);
Turli xil SQL buyruqlarini tadqiq qiling va tushuntiring: DQL, DML, DDL, DCL, TCL misollar bilan.
Talabalar jadvaliga uchta yozuv kiritish uchun so'rov yozing.*/
--DQL bu data query language - select 
--DML bu data manipulation language - update, insert, delete
--DDL data definition language bu create, alter, drop. 
-- DCL data control language bu rewoke, grant 
--TCL tranzaction language bu roll back, save piont,  commit, go 
--lesson_2
--EmployeesUstunlar bilan jadval yarating : EmpIDINT, Name(VARCHAR(50)) va Salary(DECIMAL(10,2)).

create table Employees (
EmpID int,
Name Varchar(50),
Salary DECIMAL (10,2)
);
select * from Employees
insert into Employees Values (2, 'Nodir', 7000),(3, 'Humo', 10000), (4, 'Arslon', 250000)
select * from Employees
 update Employees set Salary = 7000 where EmpID =1
  
delete Employees where EmpID = 2
 
--NameJadvaldagi ustunni Employeesga o'zgartiring VARCHAR(100).
Alter table Employees Alter column Name Varchar(100)

--Jadvalga yangi ustun Department( VARCHAR(50)) qo'shing Employees.
alter table Employees add Department Varchar(50);
--Ustunning ma'lumotlar turini Salaryga o'zgartiring FLOAT.
alter table employees alter column Salary FLOAT;
--DepartmentsUstunlar DepartmentID(INT, PRIMARY KEY) va DepartmentName(VARCHAR(50)) bilan boshqa jadval yarating .
Create Table Departments (
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
	);
--Jadvaldagi barcha yozuvlarni Employeesuning tuzilishini o'chirmasdan olib tashlang.
DROP table Employees
 


-- Yuqori darajadagi vazifalar (9)
--Mahsulotlar nomli jadvalni kamida 5 ta ustundan iborat yarating, jumladan:
ProductID (Birlamchi kalit), Mahsulot nomi (VARCHAR), Kategoriya (VARCHAR), Narx (DECIMAL)
create table Products (
ID INT PRIMARY KEY,
ProductName VARCHAR(50),
Category VARCHAR (50), 
Price DECIMAL (10,2)
CONSTRAINT P_Check CHECK (Price>0)
);

DROP TABLE Products
--Narx har doim 0 dan katta bo'lishini ta'minlash uchun CHECK cheklovini qo'shing.
--DEFAULT qiymati 50 bo'lgan StockQuantity ustunini qo'shish uchun jadvalni o'zgartiring.
Alter Table Products add SrockQuatity INT DEFAULT 50
--Turkum nomini ProductCategory deb o‘zgartiring
EXEC sp_rename 'Products.ProductNOMI', 'ProductTURI', 'COLUMN';

--Standart INSERT INTO so'rovlari yordamida Mahsulotlar jadvaliga 5 ta yozuvni kiriting.
select * from Products;
insert into Products values (1, 'olma', 'meva', 15000, 100), (2, 'stol', 'yog''och', 100000, 500),(3, 'suv', 'ichimlik', 12000, 700)
select * from Products
--Barcha Mahsulotlar maʼlumotlarini oʻz ichiga olgan Products_Backup nomli zaxira
jadvalini yaratish uchun SELECT INTO dan foydalaning.
select * from Products where select into Products_backup 
select * 
Into Products_backup
from Products
drop table Products_backup
 select * 
 into Products_backup
 from Products
--Mahsulotlar jadvalining nomini Inventar deb o'zgartiring.
EXEC sp_rename 'dbo.Products', 'Inventar', 'OBJECT'
--Narx ma'lumotlar turini DECIMAL(10,2) dan FLOAT ga o'zgartirish uchun Inventar jadvalini o'zgartiring.
alter table Inventar alter column Price DECIMAL (10,2)
--1000 dan boshlanadigan va Inventory jadvalga 5 ga oshiriladigan ProductCode nomli IDENTITY ustunini qo'shing.
alter table Inventar add ProductCode INT IDENTITY (1000, 5)
select * from Inventar
