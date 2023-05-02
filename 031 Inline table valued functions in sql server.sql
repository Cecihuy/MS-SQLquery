--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	Id INT,
	Name NVARCHAR(20),
	DateOfBirth DATETIME,
	Gender NVARCHAR(20),
	DepartmentId INT);

INSERT INTO tblEmployee
	VALUES(1,'Sam','1980-12-30 00:00:00.000','Male',1),
		  (2,'Pam','1982-09-01 12:02:36.260','Female',2),
		  (3,'John','1985-08-22 12:03:30.370','Male',1),
		  (4,'Sara','1979-11-29 12:59:30.670','Female',3),
		  (5,'Todd','1978-11-29 12:59:30.670','Male',1);

SELECT*FROM tblEmployee;

CREATE TABLE tblDepartment(
	Id INT,
	DepartmentName NVARCHAR(20),
	Location NVARCHAR(20),
	DepartmentHead NVARCHAR(20));

INSERT INTO tblDepartment
VALUES(1,'IT','London','Rick'),
	  (2,'Payroll','Delhi','Ron'),
	  (3,'HR','New York','Christie'),
	  (4,'Other','Sydney','Cindrella');

SELECT*FROM tblDepartment;
--End Preparation

--Start create function
CREATE FUNCTION fn_EmployeeByGender (@gender NVARCHAR(10))
RETURNS TABLE
AS
RETURN(
	SELECT Id,Name,DateOfBirth,Gender,DepartmentId
	FROM tblEmployee
	WHERE Gender=@gender);
--End creating function

--First Try
SELECT*FROM fn_EmployeeByGender('Female');
--End. return tblEmployee with gender Female

--First Try
SELECT*FROM fn_EmployeeByGender('Female')
	WHERE Name='Pam';
--End. return tblEmployee with gender Female and Name is Pam

--Second Try
SELECT Name,Gender,DepartmentName
	FROM fn_EmployeeByGender('Male')
	LEFT OUTER JOIN tblDepartment 
	ON fn_EmployeeByGender.DepartmentId = tblDepartment.Id;
--End

--Third Try
SELECT Name,Gender,DepartmentName
	FROM fn_EmployeeByGender('Male') E
	LEFT OUTER JOIN tblDepartment D
	ON E.DepartmentId = D.Id;
--End