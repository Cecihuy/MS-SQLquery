--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	Id INT,
	Name NVARCHAR(20),
	Gender NVARCHAR(20),
	DepartmentId INT);

INSERT INTO tblEmployee
	VALUES(1,'John','Male',3),
		  (2,'Mike','Male',2),
		  (3,'Pam','Female',1),
		  (4,'Todd','Male',4),
		  (5,'Sara','Female',1),
		  (6,'Ben','Male',3);

CREATE TABLE tblDepartment(
	DeptId INT,
	DeptName NVARCHAR(20));


INSERT INTO tblDepartment
	VALUES(1,'IT'),
		  (2,'Payroll'),
		  (3,'HR'),
		  (4,'Admin');

SELECT*FROM tblEmployee;
SELECT*FROM tblDepartment;
--End Preparation

--Firts Try
WITH Employees_Name_Gender
AS(
	SELECT Id,Name,Gender
		FROM tblEmployee
  )
SELECT*FROM Employees_Name_Gender;
--End. execute CTE

--Second Try
WITH Employees_Name_Gender
AS(
	SELECT Id,Name,Gender
		FROM tblEmployee
  )
UPDATE Employees_Name_Gender
	SET Gender = 'Female'
	WHERE Id = 1;
--End. updating CTE is possible to update underlying base tables

--Third Try
SELECT*FROM tblEmployee;
--End. execute to check

--Fourth Try
WITH EmployeesByDepartment
AS(
	SELECT Id,Name,Gender,DeptName
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblDepartment.DeptId = tblEmployee.DepartmentId
  )
SELECT*FROM EmployeesByDepartment;
--End. execute CTE with joining two tables

--Fifth Try
WITH EmployeesByDepartment
AS(
	SELECT Id,Name,Gender,DeptName
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblDepartment.DeptId = tblEmployee.DepartmentId
  )
UPDATE EmployeesByDepartment
	SET Gender = 'Male'
	WHERE Id = 1;
--End. updating CTE is allowed if only affecting one base table. execute Third Try to check

--Fifth Try
WITH EmployeesByDepartment
AS(
	SELECT Id,Name,Gender,DeptName
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblDepartment.DeptId = tblEmployee.DepartmentId
  )
UPDATE EmployeesByDepartment
	SET Gender = 'Female', DeptName = 'IT'
	WHERE Id = 1;
--End. error. updating CTE is not allowed if affecting multiple base table.

--Sixth Try
SELECT*FROM tblEmployee;
SELECT*FROM tblDepartment;
--End. pay attention to the tables before executing Seventh Try

--Seventh Try
WITH EmployeesByDepartment
AS(
	SELECT Id,Name,Gender,DeptName
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblDepartment.DeptId = tblEmployee.DepartmentId
  )
UPDATE EmployeesByDepartment
	SET DeptName = 'IT'
	WHERE Id = 1;
--End. updating CTE with multiple base tables is allowed if affect one base table,
--but the result may be wrong. in this case Ben is also changing. we want only John is changed.
--execute Sixth Try to check