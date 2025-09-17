/*
Guidelines:
There are 5 puzzles in the practical part of the exam.
Provide your solution for each puzzle in the 
solution sections.

Before the start don't forget to create 
the "sqlmidterm" database using the 
query below:
*/

create database sqlmidterm
go
use sqlmidterm

-----------------------------------------------------------------------------------------------------------------------

--PUZZLE 1:
/*
Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased. 
Use orders table. Result set should show customerid, quantity and discount percentage. 
The discount should be applied as follows:
1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%
*/
 
--SOLUTION:
 --1-variant
SELECT
	CustomerID, 
	Quantity,
	CASE 
		WHEN Quantity = 1 THEN '3%'
		WHEN quantity between 1 and 3 THEN '5%'
		ELSE '7%' END AS Discount_Percentage
FROM Orders;

--2-variant
SELECT CustomerID, 
	Quantity,
	CASE 
		WHEN Quantity = 1 THEN TotalAmount * 0.03
		WHEN quantity between 1 and 3 THEN TotalAmount * 0.05
		ELSE TotalAmount * 0.07 END AS Discount_Percentage
FROM Orders;



-----------------------------------------------------------------------------------------------------------------------------
--PUZZLE 2:
/*
Question: If all the columns have zero values, then don’t show that row. 
In this case, we have to remove the 5th row while selecting data.
*/

 --SOLUTION:
SELECT *
FROM TestMultipleZero
WHERE NOT (
    a = 0 
    AND b = 0 
    AND c = 0
    AND d = 0
);
-------------------------------------------------------------------------------------------------------------------------------

--PUZZLE 3:
/*
Write a query to find total sales amount for the orders 
which costs more than $50 for each customer along with their least purchases.
(least amount might be lower than $50).

*/
 
---SOLUTION:
SELECT 
 CustomerID,
 sum(TotalAmount) AS TotalSales,
 min(TotalAmount) AS Least_Purchase
FROM Orders
GROUP BY CustomerID
HAVING sum(TotalAmount) > 50;

 




-----------------------------------------------------------------------------------------------------------------------------

--PUZZLE 4:
/*
Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
Expected Columns: EmployeeName, Salary
*/

 
 
--SOLUTION:

SELECT 
    name as EmployeeName,
    Salary
FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees as e
    WHERE e.DepartmentID = e.DepartmentID
);



---------------------------------------------------------------------------------------------------------------------


--PUZZLE 5:
/*
Find those parents who has only girls.
*/

 
--SOLUTION:
 
SELECT girls.ParentName  
FROM girls
	LEFT JOIN boys
		ON girls.ParentName = boys.ParentName 
WHERE boys.id is null;


----------------------------------------------------------------------------------------------------------------------------------

--PUZZLE 5:
/*
Return: CustomerName, City, OrderID, Amount
Task: List orders where the customer is from Los Angeles and the order amount is 
greater than 300.
Tables Used: Customers, Orders
*/

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'janesmith@yahoo.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Alice', 'Johnson', 'alicej@outlook.com', '555-3456', '789 Pine St', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(4, 'Bob', 'Brown', 'bobbrown@hotmail.com', '555-4567', '101 Maple St', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(5, 'Charlie', 'Davis', 'charliedavis@gmail.com', '555-5678', '202 Birch St', 'Sydney', 'NSW', '2000', 'Australia'),
(6, 'David', 'Martinez', 'davidm@live.com', '555-6789', '303 Cedar St', 'Melbourne', 'VIC', '3000', 'Australia'),
(7, 'Emily', 'Garcia', 'emilyg@yahoo.com', '555-7890', '404 Redwood St', 'London', 'England', 'SW1A 1AA', 'UK'),
(8, 'Frank', 'Hernandez', 'frankh@outlook.com', '555-8901', '505 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(9, 'Grace', 'Lopez', 'gracel@gmail.com', '555-9012', '606 Aspen St', 'Birmingham', 'England', 'B1 1AA', 'UK'),
(10, 'Helen', 'Gonzalez', 'heleng@yahoo.com', '555-0123', '707 Fir St', 'Berlin', 'BE', '10117', 'Germany'),
(11, 'Irene', 'Perez', 'irenep@hotmail.com', '555-1234', '808 Maple Ave', 'Munich', 'BY', '80331', 'Germany'),
(12, 'Jack', 'Wilson', 'jackw@live.com', '555-2345', '909 Oak Ave', 'Hamburg', 'HH', '20095', 'Germany'),
(13, 'Kim', 'Anderson', 'kima@gmail.com', '555-3456', '111 Pine Ave', 'Paris', 'Île-de-France', '75001', 'France'),
(14, 'Liam', 'Thomas', 'liamt@yahoo.com', '555-4567', '222 Cedar Ave', 'Lyon', 'Auvergne-Rhône-Alpes', '69001', 'France'),
(15, 'Megan', 'Taylor', 'megant@outlook.com', '555-5678', '333 Redwood Ave', 'Marseille', 'Provence-Alpes-Côte Azur', '13001', 'France'),
(16, 'Nathan', 'Moore', 'nathanm@hotmail.com', '555-6789', '444 Willow Ave', 'Tokyo', 'TK', '100-0001', 'Japan'),
(17, 'Olivia', 'Jackson', 'oliviaj@gmail.com', '555-7890', '555 Birch Ave', 'Osaka', 'OS', '530-0001', 'Japan'),
(18, 'Paul', 'White', 'paulw@yahoo.com', '555-8901', '666 Maple Blvd', 'Kyoto', 'KY', '600-8001', 'Japan'),
(19, 'Quincy', 'Lee', 'quincyl@outlook.com', '555-9012', '777 Oak Blvd', 'Seoul', 'SO', '04547', 'South Korea'),
(20, 'Rachel', 'Harris', 'rachelh@hotmail.com', '555-0123', '888 Pine Blvd', 'Busan', 'BU', '48058', 'South Korea'),
(21, 'Sam', 'Clark', 'samc@gmail.com', '555-1234', '999 Cedar Blvd', 'Incheon', 'IC', '22382', 'South Korea'),
(22, 'Tina', 'Allen', 'tinaallen@yahoo.com', '555-2345', '1010 Redwood Blvd', 'Mexico City', 'CMX', '01000', 'Mexico'),
(23, 'Ursula', 'Scott', 'ursulas@outlook.com', '555-3456', '1111 Willow Blvd', 'Guadalajara', 'JAL', '44100', 'Mexico'),
(24, 'Victor', 'Adams', 'victora@hotmail.com', '555-4567', '1212 Birch Blvd', 'Monterrey', 'NLE', '64000', 'Mexico'),
(25, 'Walter', 'Baker', 'walterb@live.com', '555-5678', '1313 Oak Blvd', 'New York', 'NY', '10001', 'USA'),
(26, 'Xander', 'Nelson', 'xandern@gmail.com', '555-6789', '1414 Cedar Blvd', 'Los Angeles', 'CA', '90001', 'USA'),
(27, 'Yvonne', 'Carter', 'yvonnec@yahoo.com', '555-7890', '1515 Maple Dr', 'Chicago', 'IL', '60601', 'USA'),
(28, 'Zane', 'Mitchell', 'zanem@outlook.com', '555-8901', '1616 Redwood Dr', 'Houston', 'TX', '77001', 'USA'),
(29, 'Anna', 'Roberts', 'annar@hotmail.com', '555-9012', '1717 Willow Dr', 'Sydney', 'NSW', '2000', 'Australia'),
(30, 'Ben', 'King', 'benk@live.com', '555-0123', '1818 Birch Dr', 'Melbourne', 'VIC', '3000', 'Australia'),
(31, 'Chloe', 'Green', 'chloeg@gmail.com', '555-1234', '1919 Oak Dr', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(32, 'Daniel', 'Evans', 'daniele@yahoo.com', '555-2345', '2020 Cedar Dr', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(33, 'Ella', 'Collins', 'ellac@outlook.com', '555-3456', '2121 Redwood Dr', 'London', 'England', 'SW1A 1AA', 'UK'),
(34, 'Finn', 'Morris', 'finnm@hotmail.com', '555-4567', '2222 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(35, 'Grace', 'Lee', 'gracel@live.com', '555-5678', '2323 Birch St', 'Berlin', 'BE', '10117', 'Germany'),
(36, 'Holly', 'Martinez', 'hollym@gmail.com', '555-6789', '2424 Oak St', 'Munich', 'BY', '80331', 'Germany'),
(37, 'Ian', 'Robinson', 'ianr@yahoo.com', '555-7890', '2525 Cedar St', 'Warsaw', 'WA', '00-001', 'Poland'),
(38, 'Jasmine', 'Walker', 'jasminew@outlook.com', '555-8901', '2626 Redwood St', 'Lisbon', 'LI', '1100-148', 'Portugal'),
(39, 'Kyle', 'Young', 'kyley@hotmail.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201','USA'),
(40, 'Liam', 'Harris', 'liamh@live.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220','USA');


DROP TABLE IF EXISTS Orders;


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT NULL,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2)
);


INSERT INTO Orders VALUES
(102, 15, 2, '2023-05-14', 1, 800.00),
(205, 8, 3, '2024-09-07', 2, 800.00),
(311, 22, 4, '2022-11-22', 1, 250.00),
(421, 33, 5, '2021-03-30', 3, 150.00),
(523, 40, NULL, '2025-07-19', 1, 30.00),
(610, 19, 7, '2022-08-25', 2, 300.00),
(728, 14, 8, '2024-06-10', 1, 200.00),
(812, 27, 9, '2021-12-04', 4, 40.00),
(915, 6, 10, '2023-02-18', 1, 10.00),
(1003, 31, NULL, '2025-09-27', 2, 360.00),
(1108, 12, 12, '2023-10-11', 1, 500.00),
(1205, 29, 13, '2024-04-03', 1, 25.00),
(1354, 4, 14, '2022-07-29', 2, 60.00),
(1411, 9, 15, '2021-01-22', 3, 135.00),
(1533, 23, NULL, '2025-11-15', 1, 80.00),
(1622, 36, 17, '2022-10-08', 1, 60.00),
(1710, 1, 18, '2023-06-21', 2, 40.00),
(1845, 20, 19, '2021-09-13', 5, 50.00),
(1908, 37, 20, '2025-03-05', 2, 50.00),
(2042, 10, 21, '2024-08-14', 1, 60.00),
(2157, 13, 22, '2022-12-01', 1, 100.00),
(2268, 35, 23, '2023-09-09', 1, 15.00),
(2349, 7, 24, '2021-07-18', 2, 180.00),
(2481, 17, NULL, '2025-06-23', 3, 15.00),
(2594, 5, 26, '2023-03-12', 4, 100.00),
(2633, 26, 27, '2022-04-07', 1, 450.00),
(2782, 39, 28, '2024-11-30', 1, 600.00),
(2845, 24, 29, '2021-02-25', 1, 500.00),
(2903, 2, 30, '2025-05-28', 2, 240.00),
(3011, 16, 31, '2023-08-20', 1, 350.00),
(3152, 21, 32, '2022-01-17', 1, 450.00),
(3227, 38, 33, '2025-09-10', 1, 40.00),
(3368, 11, 34, '2021-04-04', 2, 100.00),
(3419, 3, 35, '2024-07-15', 3, 120.00),
(3551, 18, 36, '2022-10-31', 1, 60.00),
(3684, 32, 37, '2023-12-22', 1, 35.00),
(3749, 28, 38, '2021-06-06', 2, 110.00),
(3872, 25, NULL, '2025-02-01', 1, 40.00),
(3911, 30, 40, '2023-11-26', 3, 120.00),
(4057, 22, 1, '2024-03-09', 1, 1200.00);


---SOLUTION:









---------------------------------------END OF EXAM--------------------------------------------------------------------------------







