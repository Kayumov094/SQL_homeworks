 --Part Easy 
/*  data -  biror narsa yoki holat to'grisidagi faktlar, qiymatlar yoki kuzatishlar to‘plami;
ular sonlar, matnlar, rasmlar yoki boshqa ko‘rinishda bo‘lishi mumkin. */

/* database - Ma’lumotlar(data)ni  tartibli, tuzilgan va boshqariladigan holda saqlash tizimi.*/

/* Relational database(Relyatsion ma’lumotlar bazasi) – Ma’lumotlarni jadval (table) ko‘rinishida, saqlanadigan ma’lumotlar bazasi turi. 
Jadvaldagi ma’lumotlar o‘zaro bog‘langan bo‘ladi.*/

/*Table (Jadval) – Ma’lumotlar bazasida ma’lumotlarni satrlar va ustunlar (columns) ko‘rinishida saqlovchi asosiy tuzilma.*/

/* SQL Serverning 5 ta asosiy xususiyati:
High Performance – Katta hajmdagi ma’lumotlar bilan tezkor ishlash imkoniyati.
Security – Ma’lumotlarni himoya qilish uchun kuchli autentifikatsiya va ruxsat nazorati tizimimavjudligi.
Scalability – Kichikdanhajmdagi loyihalardan tortib,  katta hajmgacha bo‘lgan loyihalarda ishlash imkoniyatini beradi.
Backup and Restore – Ma’lumotlarni zahiralash va qayta tiklash imkoniyatitaqdim etadi .
Integration Services – Turli manbalardan ma’lumotlarni yig‘ish, o‘zgartirish va yuklash (ETL va  ELT ) imkoniyati.*/

/* SQL Server’da mavjud autentifikatsiya turlari:
Windows Authentification- Foydalanuvchi tizimga Windows foydalanuvchi hisob ma’lumotlari bilan kirgan bo‘lsa, shu ma’lumotlardan SQL Server’ga kirishda ham foydalanadi.
SQL Server Authentification - Foydalanuvchi SQL Server ichida alohida login va parol yaratadi va shu ma’lumotlar bilan tizimga kiradi.
Microsoft Entra MFA - Foydalanuvchi kirishda faqat login va parol emas, balki qo‘shimcha xavfsizlik bosqichidan ham o‘tadi (masalan, telefon orqali tasdiqlash, kod yuborish, biometrik tekshiruv).
Microsoft Entra Password - Kirish Microsoft Entra (avvalgi Azure Active Directory) tizimida saqlangan foydalanuvchi paroli orqali amalga oshiriladi. 
Microsoft Entra Integrated - Foydalanuvchi tizimga kirganida Microsoft Entra (AAD) identifikatori bilan avtomatik bog‘lanadi.
Microsoft Service Principal - Xizmatlar yoki ilovalar SQL Server’ga parolsiz kirishi uchun ishlatiladigan maxsus identifikator.
Microsoft Entra Managed Identity - Azure’da ishlaydigan xizmatlar uchun maxsus autentifikatsiya turi.
Microsoft Entra Default - Microsoft Entra’da oldindan belgilangan va standart bo‘lib ishlatiladigan autentifikatsiya usuli.  */ 

--PART MEDIUM 
IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'SchoolDB'
)
BEGIN
    CREATE DATABASE SchoolDB;
END;

CREATE TABLE Students(
	StudentID 	INT  PRIMARY KEY,
	Name VARCHAR(50), 
	Age INT
)

/* SQL Server- Microsoft ishlab chiqargan ma’lumotlar bazasi boshqaruv tizimi (DBMS). 
U Ma’lumotlarni saqlash, boshqarish, himoyalash va so‘rovlarni bajarish uchun xizmat qiladi.
Bu server dasturi, ya’ni orqa fonda ishlaydi va foydalanuvchilarning so‘rovlarini bajarish xususiyatiga ega.

SSMS (SQL Server Management Studio) -  Microsoft’ning grafik interfeysga ega boshqaruv vositasi. 
U SQL Server’ni boshqarish, ma’lumotlar bazasini yaratish, tahrirlash va kuzatish vazifasini bajaradi.
Bu klient dastur bo'lib, foydalanuvchi SQL Server bilan qulay grafik muhit orqali ishlash vazifasini bajaradi.

SQL (Structured Query Language)-Ma’lumotlar bazasi bilan ishlash uchun mo‘ljallangan standart so‘rov tili.
Ma’lumotlarni qo‘shish, o‘chirish, yangilash va qidirish amallarini bajaradi. 
SQL Server’da ishlash uchun yoziladigan buyruqlar va so‘rovlar shu tilda yoziladi.

Birinchisi server, ikkinchisi boshqaruv paneli, uchinchisi - so'rov tili */

--PART HARD

/*DQL - data query language = SELECT - maluaotlarni chaqirib oladi
SQL Query > SELECT;
						DISTINCT; - unikal qiymatlarni 
						TOP; yuqoridan 
						FROM; qayerdan tortib olishni aniqlashtiradi 
						JOIN; jadvallarni birlashtiradi 
						WHERE; ma'lumotlarga filtr qo'yadi 
						GROUP BY; bir xil to'plamga mansub qatorlarni birlashtiradi, natijaga aggregat funksiyalarni qo'llaydi 
						HAVING; guruhlangandan qaytgan ma'lumotlar uchun filtr qo'yadi 
						ORDER BY najijani tartiblab chiqaradi (ASC- kichikdan kattaga qarab, DESC - kattadan kichikka qarab)
 for example: SELECT * FROM students*/

 /* DML - Data manipulation language - INSERT - jadvalga yangi ma'lumot joylashtiradi 
																			UPDATE - jadvaldagi mavjud ma'lumotlarni yangilaydi
																			DELETE - jadvaldagi ma'lumotlarni o'chiradi 

for example - INSERT INTO students (StudentID, name, AGE) values (1, 'John', 30)
						 UPDATE Students SET name = 'HELEN' Where StudentID =1
						 DELETE Students Where StudentID =1*/

/* DDL - Data definition language - CRETAE - yangi object yaratdi
																	ALTER - mavjud jadvalni o'zgartiradi
																	DROP - mavjud objectni o'zgartiradi
DCL - Data Control Language GRANT - Biror foydalanuvchiga yoki rolga ma’lum huquqlar berish
														REWOKE -  Avval berilgan huquqlarni olib tashlash

TCL - Transaction Control Language - Bazadagi o'zgarish nazorat qiladi BEGIN
																																		COMMIT
																																		ROLLBACK
																																		SAVEPOINT*/

INSERT INTO Students (StudentID, name, Age) 
values (1, 'Arslonbek', 30), (2, 'Sardorbek', 33), (3, 'Sevara', 35)

Select * from Students 
 





