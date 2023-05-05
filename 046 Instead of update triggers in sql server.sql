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
UPDATE vwEmployeeDetails
	SET Name='Johny',
	DeptName='IT'
	WHERE Id=1;
--End. result error because it try to modif multiple base table

--Fourth Try. before do this, execute Second Try and 
--pay attention for id 1 and 6 DeptName
UPDATE vwEmployeeDetails
	SET DeptName='IT'
	WHERE Id=1;
--End. it will changing all HR to IT. it doesn't correct.
--Execute Second Try to check

--Fifth Try
UPDATE tblDepartment
	SET DeptName='HR'
	WHERE DeptId=3;
--End. we changing back data to correct value

--Sixth Try
CREATE TRIGGER trVWemployeeDetails_insteadOfUpdate
	ON vwEmployeeDetails
	INSTEAD OF UPDATE
	AS
	BEGIN
		--If EmployeeId is updated
		IF(UPDATE(Id))
		BEGIN
			RAISERROR('Id cannot be changed',16,1)
			RETURN
		END
		--If DeptName is updated
		IF(UPDATE(DeptName))
		BEGIN
			DECLARE @deptId INT
			SELECT @deptId=DeptId
				FROM tblDepartment
				JOIN inserted
				ON inserted.DeptName=tblDepartment.DeptName

			IF(@deptId IS NULL)
			BEGIN 
				RAISERROR('Invalid Department Name', 16, 1)
				RETURN
			END

			UPDATE tblEmployee
				SET DepartmentId=@deptId
				FROM inserted
				JOIN tblEmployee
				ON tblEmployee.Id=inserted.Id
		END

		--If gender is updated
		IF(UPDATE(Gender))
		BEGIN
			UPDATE tblEmployee
				SET Gender=inserted.Gender
				FROM inserted
				JOIN tblEmployee
				ON tblEmployee.Id=inserted.Id
		END

		--If Name is updated
		IF(UPDATE(Name))
		BEGIN
			UPDATE tblEmployee
				SET Name=inserted.Name
				FROM inserted
				JOIN tblEmployee
				ON tblEmployee.Id=inserted.Id
		END
	END;
--End. creating trigger

--Seventh Try
UPDATE vwEmployeeDetails
	SET DeptName='UVUWEWE'
	WHERE Id=1;
--End. throws error

--Eight Try
UPDATE vwEmployeeDetails
	SET DeptName='IT'
	WHERE Id=1;
--End. now it works correctly

--Ninth Try
UPDATE vwEmployeeDetails
	SET Name='Johny',Gender='Female',DeptName='Payroll'
	WHERE Id=1;
--End. make sure with more changes