--Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	ID INT PRIMARY KEY,
	Name NVARCHAR(50),
	Gender NVARCHAR(50),
	Salary INT,
	DepartmentId INT);

INSERT INTO tblEmployee
	VALUES(1,'Tom','Male',4000,1),
		  (2,'Pam','Female',3000,3),
		  (3,'John','Male',3500,1),
		  (4,'Sam','Male',4500,2),
		  (5,'Todd','Male',2800,2),
		  (6,'Ben','Male',7000,1),
		  (7,'Sara','Female',4800,3),
		  (8,'Valarie','Female',5500,1),
		  (9,'James','Male',6500,NULL),
		  (10,'Russell','Male',8800,NULL);

CREATE TABLE tblDepartment(
	ID INT PRIMARY KEY,
	DepartmentName NVARCHAR(50),
	Location NVARCHAR(50),
	DepartmentHead NVARCHAR(50));

INSERT INTO tblDepartment
	VALUES(1,'IT','London','Rick'),
		  (2,'Payroll','Delhi','Ron'),
		  (3,'HR','New York','Christie'),
		  (4,'Other Department','Sydney','Cindrella');

ALTER TABLE tblEmployee
	ADD CONSTRAINT FK_tblEmployee_tblDepartment_DepartmentId
	FOREIGN KEY (DepartmentId) REFERENCES tblDepartment(ID);

SELECT*FROM tblEmployee;
SELECT*FROM tblDepartment;
--End Preparation

--Only none matching rows from left table
SELECT Name, Gender, Salary, DepartmentName
	FROM tblEmployee
	LEFT JOIN tblDepartment
	ON tblEmployee.DepartmentId=tblDepartment.ID
	WHERE tblEmployee.DepartmentId IS NULL;
--End

--Or
SELECT Name, Gender, Salary, DepartmentName
	FROM tblEmployee
	LEFT JOIN tblDepartment
	ON tblEmployee.DepartmentId=tblDepartment.ID
	WHERE tblDepartment.ID IS NULL;
--End

--Only none matching rows from right table
SELECT Name, Gender, Salary, DepartmentName
	FROM tblEmployee
	RIGHT JOIN tblDepartment
	ON tblEmployee.DepartmentId=tblDepartment.ID
	WHERE tblEmployee.DepartmentId IS NULL;
--End

--Only none matching rows from both table
SELECT Name, Gender, Salary, DepartmentName
	FROM tblEmployee
	FULL JOIN tblDepartment
	ON tblEmployee.DepartmentId=tblDepartment.ID
	WHERE tblEmployee.DepartmentId IS NULL 
	OR tblDepartment.ID IS NULL;
--End