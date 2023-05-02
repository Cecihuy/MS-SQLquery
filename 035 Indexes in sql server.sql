--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	Id INT,
	Name NVARCHAR(20),
	Salary INT,
	Gender NVARCHAR(20));

INSERT INTO tblEmployee
	VALUES(1,'Sam',2500,'Male'),
		  (2,'Pam',6500,'Female'),
		  (3,'John',4500,'Male'),
		  (4,'Sara',5500,'Female'),
		  (5,'Todd',3100,'Male');
SELECT*FROM tblEmployee;
--End Preparation

--First Try
CREATE INDEX IX_tblEmployee_Salary
	ON tblEmployee(Salary ASC);
--End. create index

--Second Try
sp_helpindex tblEmployee;
--End. inspect indexing on specifying table

--Third Try
DROP INDEX tblEmployee.IX_tblEmployee_Salary;
--End. must specifying name of tables