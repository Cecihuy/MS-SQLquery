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
DELETE FROM vwEmployeeDetails WHERE Id=1;
--End. error, trying to modif multiple base tables.

--Fourth Try
CREATE TRIGGER trVWemployeeDetails_insteadOfDelete
	ON vwEmployeeDetails
	INSTEAD OF DELETE
	AS
	BEGIN
		DELETE tblEmployee
		FROM tblEmployee
		JOIN deleted
		ON tblEmployee.ID=deleted.Id

		--Subquery alternate
		--DELETE FROM tblEmployee
		--WHERE Id IN (SELECT Id FROM deleted)
	END;
--End. creating trigger

--Fifth Try
DELETE FROM vwEmployeeDetails WHERE Id IN (1,2);
--End. with succeess

--Sixth Try
ALTER TRIGGER trVWemployeeDetails_insteadOfDelete
	ON vwEmployeeDetails
	INSTEAD OF DELETE
	AS
	BEGIN
		--DELETE tblEmployee
		--FROM tblEmployee
		--JOIN deleted
		--ON tblEmployee.ID=deleted.Id

		--Subquery alternate
		DELETE FROM tblEmployee
		WHERE Id IN (SELECT Id FROM deleted)
	END;
--End. this result same