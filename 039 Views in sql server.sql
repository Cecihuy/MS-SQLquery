--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	Id INT,
	Name NVARCHAR(20),
	Salary INT,
	Gender NVARCHAR(20),
	DepartmentId INT);

INSERT INTO tblEmployee
	VALUES(1,'John',5000,'Male',3),
		  (2,'Mike',3400,'Male',2),
		  (3,'Pam',6000,'Female',1),
		  (4,'Todd',4800,'Male',4),
		  (5,'Sara',3200,'Female',1),
		  (6,'Ben',4800,'Male',3);

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

--First Try
SELECT Id,Name,Salary,Gender,DeptName
	FROM tblEmployee
	LEFT OUTER JOIN tblDepartment
	ON tblEmployee.DepartmentId=tblDepartment.DeptId;
--End.

--Second Try
CREATE VIEW vwEmployeesByDepartment
AS
	SELECT Id,Name,Salary,Gender,DeptName
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId;
--End. creating view based on First Try

--Third Try
SELECT*FROM vwEmployeesByDepartment;
--End. way to see view is treated like table

--Fourth Try
CREATE VIEW vwITemployees
AS
	SELECT Id,Name,Salary,Gender,DeptName
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId
		WHERE tblDepartment.DeptName='IT';
--End. create view only for IT department related data

--Fifth Try
SELECT*FROM vwITemployees;
--End. this views implement row security

--Sixth Try
CREATE VIEW vwNOconfidentialData
AS
	SELECT Id,Name,Gender,DeptName
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId;
--End. create view without salary data

--Seventh Try
SELECT*FROM vwNOconfidentialData;
--End. this views implement column security

--Eight Try
CREATE VIEW vwSummarizedData
AS
	SELECT DeptName, COUNT(Id) AS TotalEmployees
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId
		GROUP BY DeptName;
--End. create view to sum total employee by department

--Ninth Try
SELECT*FROM vwSummarizedData;
--End. presenting aggregated data and hide detailed data.

/*
to modify view - ALTER VIEW statement
to drop view - DROP VIEW vwName
*/