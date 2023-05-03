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
		  (2,'Mikey',NULL,'Male',2),
		  (3,'Pam',6000,'Female',1),
		  (4,'Todd',4800,'Male',4),
		  (5,'Sara',3200,'Female',1),
		  (6,'Ben',4800,'Male',3);

CREATE TABLE ##TestTempTable(
	Id INT,
	Name NVARCHAR(20),
	Gender NVARCHAR(20));

INSERT INTO ##TestTempTable
	VALUES(101,'Martin','Male'),
		  (102,'Joe','Female'),
		  (103,'Pam','Female'),
		  (104,'James','Male');

SELECT*FROM tblEmployee;
--End Preparation

--First Try
CREATE VIEW vwEmployeeDetails
AS
	SELECT Id,Name,Gender,DepartmentId
		FROM tblEmployee;
--End

--Second Try
SELECT*FROM vwEmployeeDetails;
--End

--Third Try
CREATE VIEW vwEmployeeDetailsParameter
@gender NVARCHAR(20)
AS
	SELECT Id,Name,Gender,DepartmentId
		FROM tblEmployee
		WHERE Gender=@gender;
--End. we cannot create parameterize views

--Fourth Try
SELECT*FROM vwEmployeeDetails
	WHERE Gender='Male';
--End. way to filter through views by Gender instead of parameter

--Fifth Try
CREATE FUNCTION fnEmployeeDetails(@gender NVARCHAR(20))
RETURNS TABLE
AS
	RETURN(
		SELECT Id,Name,Gender,DepartmentId
			FROM tblEmployee
			WHERE Gender=@gender);
--End. create inline table function for replacement of parameterized views

--Sixth Try
SELECT*FROM dbo.fnEmployeeDetails('Male');
--End. to call function with parameter

--Seventh Try
ALTER VIEW vwEmployeeDetails
AS
	SELECT Id,Name,Gender,DepartmentId
		FROM tblEmployee
		ORDER BY Id;
--End. we also can't create views with ORDER BY clause

--Eight Try
SELECT*FROM ##TestTempTable;
--End. check temp table

--Ninth Try
CREATE VIEW vwOnTempTable
AS
	SELECT Id,Name,Gender
		FROM ##TestTempTable;
--End. we cannot create views or functions on temporary tables

/*
View Limitations
1.	You cannot pass parameters to a view. Table
	Valued functions are an excellent replacement for
	parameterized views.
2.	Rules and Defaults cannot be associated with
	views.
3.	The ORDER BY clause is invalid in views unless
	TOP or FOR XML is also specified.
4.	Views cannot be based on temporary tables.
*/