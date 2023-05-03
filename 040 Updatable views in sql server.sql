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
CREATE VIEW vwEmployeeWithoutSalary
AS
	SELECT Id,Name,Gender,DepartmentId
		FROM tblEmployee;
--End. creating view without Salary column

--Second Try
SELECT*FROM vwEmployeeWithoutSalary;
--End. only seeing data

--Third Try
UPDATE vwEmployeeWithoutSalary
	SET Name='Mikey' 
	WHERE Id=2;
--End. updating data through view. execute Second Try to see result

--Fourth Try
DELETE FROM vwEmployeeWithoutSalary
	WHERE Id=2;
--End. deleting data throught view. execute Second Try to see result

--Fifth Try
INSERT INTO vwEmployeeWithoutSalary
	VALUES(2,'Mikey','Male',2);
--End. inserting data throught view. inserting Salary data does not allowed. execute Second Try to see result

--Sixth Try
CREATE VIEW vwEmployeeDetailsByDepartment
AS
	SELECT Id,Name,Salary,Gender,DeptName
		FROM tblEmployee
		LEFT OUTER JOIN	tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId;
--End.

--Seventh Try
SELECT*FROM vwEmployeeDetailsByDepartment;
--End. view joined tables

--Eight Try. before execute this query, pay attention to Ben DeptName. before is HR
UPDATE vwEmployeeDetailsByDepartment
	SET DeptName='IT'
	WHERE Name='John';
-- End. updating John HR to IT, but it also changing Ben. execute Seventh Try to check