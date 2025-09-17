sp_tables
--You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.

SELECT 
		cast(Employee_id as VARCHAR) + NCHAR(45) + first_name +  nchar(32) + Last_name as fullname 
FROM Employees
WHERE Employee_id = 100; --outputed "100-Steven King"

--Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
--Xodimlar jadvalidagi telefon_raqamining qismini yangilang, telefon raqami ichidagi "124" pastki qatori "999" bilan almashtiriladi.
select * from Employees
 UPDATE Employees
 SET Phone_number = replace(Phone_number, '124', '999')
 WHERE Phone_number like '%124%';
 
--That displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.(Employees)
--Bu "A", "J" yoki "M" harflari bilan boshlangan barcha xodimlarning ismi va ismining uzunligini ko'rsatadi. Har bir ustunga tegishli belgini bering. 
--Natijalarni xodimlarning ismlari bo'yicha tartiblang.(Xodimlar)
select * from employees
SELECT 
	first_name,
	len(first_name) as LenFirstName
FROM Employees 
WHERE first_name LIKE 'A%' 
		or  first_name LIKE 'J%'
		or  first_name LIKE 'M%'
ORDER BY first_name 

--Write an SQL query to find the total salary for each manager ID.(Employees table)
--Har bir menejer identifikatori uchun umumiy ish haqini topish uchun SQL so'rovini yozing.(Xodimlar jadvali)
select * from Employees
SELECT 
	Manager_id,
	sum(Salary) as TotalManagerSalary
FROM Employees 
GROUP BY Manager_id

--Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table
--TestMax jadvalidagi har bir satr uchun Max1, Max2 va Max3 ustunlaridan yil va eng yuqori qiymatni olish uchun so‘rov yozing.
SELECT * FROM TestMax
SELECT Year1,
	CASE 
		WHEN max1 >max2 and max1 > max3 THEN max1 
		WHEN max2 > max1 and max2 > max3 THEN max2
		WHEN max3 > max1 and max3 > max2 THEN max3
		END AS MaxtestMax
FROM testMax; --the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table

--Find me odd numbered movies and description is not boring.(cinema)
--Menga toq sonli filmlarni toping va tavsif zerikarli emas.(kino)
 
 select 
	id,
	movie,
	description 
	from cinema 
	where id%2<> 0 and description <> 'boring'

if exists (
			select * from Cinema 
			where id% 2 = 0 and description = 'boring')
			select   
			id,
			movie,
			description 
			from cinema 
			where id %2 <> 0 and description = 'boring'
else 
	print ('Bunday kinolar mavjud emas')
 
--You have to sort data based on the Id but Id with 0 should always be the last row. Now the question is can you do that with a single order by column.(SingleOrder)
--Siz ma'lumotlarni Id asosida saralashingiz kerak, lekin 0 bilan Id har doim oxirgi qator bo'lishi kerak. Endi savol shuki, buni ustun bo'yicha bitta tartib bilan qila olasizmi.(SingleOrder)
 
SELECT * 
FROM SingleOrder
ORDER BY 
	CASE
		when id = 0 then '0'
		else '1' end desc; --sort data based on the Id but Id with 0 should always be the last row

--Write an SQL query to select the first non-null value from a set of columns. If the first column is null, move to the next, and so on. If all columns are null, return null.(person)
--Ustunlar to'plamidan birinchi nol bo'lmagan qiymatni tanlash uchun SQL so'rovini yozing. Agar birinchi ustun null bo'lsa, keyingisiga o'ting va hokazo. 
--Agar barcha ustunlar null bo'lsa, nullni qaytaring.(shaxs)
select * from Person
select id,
coalesce(ssn,Passportid, itin, 'Unknown') as fullnull
from Person
 where coalesce(ssn,Passportid, itin, 'Unknown') = 'Unknown'

 SELECT id,
       ISNULL(ssn, ISNULL(Passportid, ISNULL(itin, 'Unknown'))) AS fullnull
FROM Person;

SELECT id,
       CASE 
           WHEN ssn IS NOT NULL THEN ssn
           WHEN Passportid IS NOT NULL THEN Passportid
           WHEN itin IS NOT NULL THEN itin
           ELSE 'Unknown'
       END AS fullnull
FROM Person;


SELECT fullname, 
		substring(fullname, 1, charindex(' ', fullname)-1),
		substring(fullname, charindex(' ', fullname)+1, charindex(' ', fullname, charindex( ' ', fullname)+1) - charindex(' ', fullname) )as middle,
		substring( fullname, charindex(' ', fullname, charindex(' ', fullname)+1), len(fullname))
FROM students 
 
--For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)
--Kaliforniyaga yetkazib berilgan har bir mijoz uchun Texasga yetkazib berilgan mijoz buyurtmalarining natijasini taqdim eting. (Buyurtmalar jadvali)
 select * from Orders 
 where DeliveryState = 'TX'
 and customerID in (select CustomerID  from Orders as o2 where DeliveryState = 'CA' )
  
--Write an SQL statement that can group concatenate the following values.(DMLTable)
--Quyidagi qiymatlarni birlashtira oladigan SQL bayonotini yozing.(DMLTable)
select * from DMLTable
select 
 String_agg(String, ',') as StringAggregate 
from DMLTable
 
select 
concat_ws('-', SequenceNumber, String)
from DMLTable 

--Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times.
--Ismlari (birinchi va oxirgi) kamida 3 marta "a" harfini o'z ichiga olgan barcha xodimlarni toping.
select * from Employees 
SELECT 
	first_name,
	last_name
FROM Employees 
WHERE  len(first_name+last_Name ) - len(replace(first_name+last_name , 'a', ''))>=3

--The total number of employees in each department and the percentage of those employees who have been with the company for more than 3 years(Employees)
--Har bir bo'limdagi xodimlarning umumiy soni va kompaniyada 3 yildan ortiq ishlagan xodimlarning ulushi (Xodimlar)
 select * from Employees
 SELECT 
    Department_ID,
    COUNT(*) AS TotalEmployees,   -- Har bir bo‘limdagi jami xodimlar soni
    SUM(CASE 
            WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) > 3 THEN 1 
            ELSE 0 
        END) AS EmployeesOver3Years,  -- 3 yildan ortiq ishlaganlar soni
    CAST(
        SUM(CASE 
                WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) > 3 THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS PercentageOver3Years   -- 3 yildan ortiq ishlaganlar ulushi (%)
FROM Employees
GROUP BY Department_ID;

--Write an SQL statement that determines the most and least experienced Spaceman ID by their job description.(Personal)
 --Ish ta'rifi bo'yicha eng ko'p va eng kam tajribaga ega Spaceman ID-ni aniqlaydigan SQL bayonotini yozing.(Shaxsiy)
 select * from Personal
 select * from Personal as p1 
 where MissionCount = ( select min(MissionCount) as MinMission
 from Personal as p2 where p1.JobDescription = p2.JobDescription)
 or MissionCount = ( select max(MissionCount) as MinMission
 from Personal as p2 where p1.JobDescription = p2.JobDescription)

  
  
--  Write an SQL query that separates the uppercase letters, lowercase letters, numbers, and other characters from the given string 'tf56sd#%OqH' into separate columns.
--Berilgan "tf56sd#%OqH" qatoridan katta harflar, kichik harflar, raqamlar va boshqa belgilarni alohida ustunlarga ajratuvchi SQL so'rovini yozing.

declare @xman VARCHAR(30) = 'tf56sd#%OqH'
declare @lowercase VARCHAR(30) = ' '
declare @uppercase VARCHAR (30)= ' '
declare @nums VARCHAR(30)  = ' '
declare @others VARCHAR (30)= ' '

declare @check int = 1
while @check <= len(@xman)
begin
if ASCII ( substring( @xman, @check, 1) )between 48 and 57
	set @nums = @nums +  substring( @xman, @check, 1)

else if ASCII(substring(@xman, @check, 1)) between 65 and 90
	set @uppercase = @uppercase + substring(@xman, @check, 1)

else if ASCII(substring(@xman, @check, 1)) between 97 and 122 
	set @lowercase  = @lowercase + substring(@xman, @check, 1)

else 
	set @others = @others + substring(@xman, @check, 1)
set @check = @check + 1

end 
PRINT('Lowercase: ' + @lowercase);
PRINT('Uppercase: ' + @uppercase);
PRINT('Numbers: ' + @nums);
PRINT('Others: ' + @others);




--Write an SQL query that replaces each row with the sum of its value and the previous rows' value. (Students table)
--Har bir qatorni uning qiymati va oldingi satrlar qiymatining yig'indisi bilan almashtiradigan SQL so'rovini yozing. (Talabalar jadvali)
select * from Students 
SELECT *,
		sum(Grade) over (ORDER by StudentID) as CumulativeGrade
FROM Students 

--You are given the following table, which contains a VARCHAR column that contains mathematic
--Sizga matematik tenglamalarni o'z ichiga olgan VARCHAR ustunini o'z ichiga olgan quyidagi jadval berilgan. Tenglamalarni yig'ing va javoblarni chiqaring.(Tenglamalar)









--Given the following dataset, find the students that share the same birthday.(Student Table)
--You have a table with two players (Player A and Player B) and their scores. If a pair of players have multiple entries, aggregate their scores into a single row for each unique pair of players. Write an SQL query to calculate the total score for each unique player pair(PlayerScores)




--Quyidagi maʼlumotlar toʻplamini hisobga olgan holda, tugʻilgan kuni bir xil boʻlgan talabalarni toping.(Talabalar jadvali)
--Sizda ikkita o'yinchi (A va B o'yinchisi) va ularning ballari bo'lgan stol bor. Agar bir juft o'yinchida bir nechta yozuvlar bo'lsa, ularning ballarini har bir noyob o'yinchi juftligi uchun bitta qatorga jamlang. Har bir noyob o'yinchi juftligi uchun umumiy ballni hisoblash uchun SQL so'rovini yozing (PlayerScores)