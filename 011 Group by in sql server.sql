--Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	ID INT,
	Name NVARCHAR(50),
	Gender NVARCHAR(50),
	Salary INT,
	City NVARCHAR(50));

INSERT INTO tblEmployee
	VALUES(1,'Tom','Male',4000,'London'),
		  (2,'Pam','Female',3000,'New York'),
		  (3,'John','Male',3500,'London'),
		  (4,'Sam','Male',4500,'London'),
		  (5,'Todd','Male',2800,'Sydney'),
		  (6,'Ben','Male',7000,'New York'),
		  (7,'Sara','Female',4800,'Sydney'),
		  (8,'Valarie','Female',5500,'New York'),
		  (9,'James','Male',6500,'London'),
		  (10,'Russell','Male',8800,'London');

SELECT*FROM tblEmployee;
--End Preparation

--Agregate function SUM
SELECT SUM(Salary) FROM tblEmployee;
--End

--Agregate function MAX
SELECT MAX(Salary) FROM tblEmployee;
--End

--First Try
SELECT City, SUM(Salary) AS TotalSalary 
	FROM tblEmployee
	GROUP BY City;
--End

--Second Try
SELECT City, Gender, SUM(Salary) AS TotalSalary
	FROM tblEmployee
	GROUP BY City, Gender
	ORDER BY City ASC;
--End

--Third Try
SELECT City, Gender, SUM(Salary) AS TotalSalary, COUNT(ID) AS [Total Employees]
	FROM tblEmployee
	GROUP BY City, Gender
	ORDER BY City ASC;
--End

--Fourth Try
SELECT City, Gender, SUM(Salary) AS TotalSalary, COUNT(ID) AS [Total Employees]
	FROM tblEmployee
	GROUP BY City, Gender
	HAVING Gender='Male';
--End

--Fifth Try
SELECT City, Gender, SUM(Salary) AS TotalSalary, COUNT(ID) AS [Total Employees]
	FROM tblEmployee
	WHERE Gender='Male'
	GROUP BY City, Gender;
--End

