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

--First Try
CREATE VIEW vwEmployeeDetails
AS
SELECT Id, Name, Gender, DeptName
	FROM tblEmployee
	JOIN tblDepartment
	ON tblEmployee.DepartmentId=tblDepartment.DeptId;
--End. creating views

--Second Try
SELECT*FROM vwEmployeeDetails;
--End. check views

--Third Try
INSERT INTO vwEmployeeDetails
	VALUES(7,'Valarie','Female','IT');
--End. error, views can't update multiple base table

--Fourth Try
CREATE TRIGGER trVWemployeeDetails_insteadOfInsert
	ON vwEmployeeDetails
	INSTEAD OF INSERT
	AS
	BEGIN
		SELECT*FROM inserted
		SELECT*FROM deleted
	END
--End. execute Third Try once more

--Fifth Try
ALTER TRIGGER trVWemployeeDetails_insteadOfInsert
ON vwEmployeeDetails
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @deptId INT
	/*
	Check if there is a valid DepartmentId
	for the given DepartmentName */
	SELECT @deptId = DeptId
		FROM tblDepartment
		JOIN inserted
		ON inserted.DeptName = tblDepartment.DeptName
	/*
	If DepartmentId is null throw an error
	and stop processing */
	IF(@deptId IS NULL)
	BEGIN
		RAISERROR('Invalid Department Name, Statement terminated', 16, 1)
		RETURN
	END
	
	--Finally insert into tblEmployee table
	INSERT INTO tblEmployee(Id,Name,Gender,DepartmentId)
	SELECT Id,Name,Gender,@deptId
		FROM inserted
END;
--End.

--Sixth Try
INSERT INTO vwEmployeeDetails
	VALUES(7,'Valarie','Female','ITuvuwewe');
--End. will throw an error because invalid column name. 
--Execute Third Try for real

