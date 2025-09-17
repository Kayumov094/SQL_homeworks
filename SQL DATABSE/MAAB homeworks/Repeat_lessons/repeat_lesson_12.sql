 sp_tables
-- easy tasks
--you need to write a query that outputs "100-steven king", meaning emp_id + first_name + last_name in that format using employees table.
--Xodimlar jadvali yordamida emp_id + first_name + familiya degan ma'noni anglatuvchi "100-Steven King"ni chiqaradigan so'rovni yozishingiz kerak.
SELECT * FROM Employees
SELECT cast(EMPLOYEE_ID as VARCHAR)
	+ '-'
	+ first_name
	+ Last_Name 
FROM Employees
WHERE Employee_ID = 100;

--update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
--Xodimlar jadvalidagi telefon_raqamining qismini yangilang, telefon raqami ichidagi "124" pastki qatori "999" bilan almashtiriladi.
select * from Employees
select replace(phone_Number, '124', '999') as Update_phone
from employees



--that displays the first name and the length of the first name for all employees whose name starts with the letters 'a', 'j' or 'm'. give each column an appropriate label. sort the results by the employees' first names.(employees)

--Bu "A", "J" yoki "M" harflari bilan boshlangan barcha xodimlarning ismi va ismining uzunligini ko'rsatadi.
--Har bir ustunga tegishli belgini bering. Natijalarni xodimlarning ismlari bo'yicha tartiblang.(Xodimlar)
select first_name  from Employees 
 
SELECT first_name,
	len(first_name) as LEN_name 
FROM Employees 
WHERE first_name like 'A%' 
		or first_name like 'J%' 
		or first_name like 'M%'

 

--write an sql query to find the total salary for each manager id.(employees table)
--Har bir menejer identifikatori uchun umumiy ish haqini topish uchun SQL so'rovini yozing.(Xodimlar jadvali)
select * from Employees 
SELECT 
	m.Manager_id,
	m.first_name,
	sum(e1.Salary) as TotalSalary 
FROM Employees as e1
	inner join Employees as m
	on e1.Manager_ID = m.Employee_ID
GROUP BY m.Manager_id, m.first_name;



 
--write a query to retrieve the year and the highest value from the columns max1, max2, and max3 for each row in the testmax table

--TestMax jadvalidagi har bir satr uchun Max1, Max2 va Max3 ustunlaridan yil va eng yuqori qiymatni olish uchun so‘rov yozing.

SELECT * from testMAx
SELECT year1,
	CASE 
		WHEN max1 > max2 and max1>max3 then max1
		WHEN max2  > max1 and max2>max3  then max2
		WHEN max3 > max2 and max3> max1 then max3
		ELSE 'Unknown' end as Max_Status
FROM TestMax;

--find me odd numbered movies and description is not boring.(cinema)
--Menga toq sonli filmlarni toping va tavsif zerikarli emas.(kino)

select * from cinema

select * from (
select *,
case 
when try_cast(id as int) %2 <> 0 then 'toq' 
else 'toq emas' end as Status_
from cinema) as d
where rating <> 'boring' and Status_ ='toq' 


--you have to sort data based on the id but id with 0 should always be the last row. now the question is can you do that with a single order by column.(singleorder)
--write an sql query to select the first non-null value from a set of columns. if the first column is null, move to the next, and so on. if all columns are null, return null.(person)







--Siz ma'lumotlarni Id asosida saralashingiz kerak, lekin 0 bilan Id har doim oxirgi qator bo'lishi kerak. Endi savol shuki, buni ustun bo'yicha bitta tartib bilan qila olasizmi.(SingleOrder)
--Ustunlar to'plamidan birinchi nol bo'lmagan qiymatni tanlash uchun SQL so'rovini yozing. Agar birinchi ustun null bo'lsa, keyingisiga o'ting va hokazo. Agar barcha ustunlar null bo'lsa, nullni qaytaring.(shaxs)
