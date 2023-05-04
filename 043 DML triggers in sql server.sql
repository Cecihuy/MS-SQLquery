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

CREATE TABLE tblEmployeeAudit(
	Id INT IDENTITY(1,1),
	AuditData NVARCHAR(MAX));

SELECT*FROM tblEmployee;
SELECT*FROM tblEmployeeAudit;
--End Preparation

--First Try
CREATE TRIGGER trTblEmployee_forInsert
	ON tblEmployee
	FOR INSERT
	AS
	BEGIN
		SELECT*FROM inserted
	END;
--End. inserted is special table for trigger purpose

--Second Try
INSERT INTO tblEmployee
	VALUES(8,'Jane',1800,'Female',3);
--End. while execute this insert query, trigger will be called and it execute select inserted table

--Third Try
DROP TRIGGER trTblEmployee_forInsert;
--End. to delete trigger

--Fourth Try
CREATE TRIGGER trTblEmployee_forInsert
	ON tblEmployee
	FOR INSERT
	AS
	BEGIN
		DECLARE @id INT
		SELECT @id = Id FROM inserted
		INSERT INTO tblEmployeeAudit
			VALUES('New employee with Id= ' +
				CAST(@id AS nvarchar(5)) +
				' is added at ' +
				CAST(GETDATE() AS nvarchar(MAX)))
	END;
--End. creating inserted trigger

--Fifth Try
INSERT INTO tblEmployee
	VALUES(9,'Jimmy',1800,'Female',3);
--End. inserting new data for tblEmployee will calling trigger, inside the trigger have insert query for tblEmployeeAudit

--Sixth Try
CREATE TRIGGER trTblEmployee_forDelete
	ON tblEmployee
	FOR DELETE
	AS
	BEGIN
		DECLARE @id INT
		SELECT @id = Id FROM deleted
		INSERT INTO tblEmployeeAudit
			VALUES('An existing employee with Id= ' +
				CAST(@id AS nvarchar(5)) +
				' is deleted at ' +
				CAST(GETDATE() AS nvarchar(MAX)))
	END;
--End. creating deleted trigger

--Seventh Try
DELETE FROM tblEmployee 
	WHERE Id=1;
--End. deleting data from tblEmployee will calling trigger, inside the trigger have insert query for tblEmployeeAudit