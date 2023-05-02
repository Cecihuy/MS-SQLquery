--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	Id INT PRIMARY KEY,
	Name NVARCHAR(50),
	Salary INT,
	Gender NVARCHAR(50),
	City NVARCHAR(50));

INSERT INTO tblEmployee 
	VALUES(3,'John',4500,'Male','New York'),
		  (1,'Sam',2500,'Male','London'),
		  (4,'Sara',5500,'Female','Tokyo'),
		  (5,'Todd',3100,'Male','Toronto'),
		  (2,'Pam',6500,'Female','Sydney');
--End Preparation

--First Try
SELECT*FROM tblEmployee;
--End. it will list ascending order from Id field because primary key

--Second Try
EXECUTE SP_HELPINDEX tblEmployee;
--End. to inspect clustered index on Id field

--Third Try
DROP INDEX tblEmployee.PK__tblEmplo__3214EC071B85AC7A;
--End. if can't drop, try deleting from GUI

--Fourth Try
CREATE CLUSTERED INDEX IX_tbl_Employee_Gender_Salary
	ON tblEmployee(Gender DESC, Salary ASC);
--End.

--Sixth Try
SELECT*FROM tblEmployee;
--End. will be sort by Gender first then Salary

--Fifth Try
CREATE NONCLUSTERED INDEX IX_tblEmployee_Name
	ON tblEmployee(Name);
--End