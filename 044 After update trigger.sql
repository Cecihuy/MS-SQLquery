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
CREATE TRIGGER trTblEmployee_forUpdate
	ON tblEmployee
	FOR UPDATE
	AS
	BEGIN
		SELECT*FROM deleted
		SELECT*FROM inserted
	END;
--End. create trigger with built-in

--Second Try
UPDATE tblEmployee
	SET Name='Ben', Salary=2000, Gender='Male'
	WHERE Id=5;
--End. tblEmployee data will be changed and it also triggering built-in tables

--Third Try
DROP TRIGGER trTblEmployee_forUpdate;
--End.

--Fourth Try
CREATE TRIGGER trTblEmployee_forUpdate
	ON tblEmployee
	FOR UPDATE
	AS
	BEGIN
		DECLARE @id INT
		DECLARE @oldName NVARCHAR(20), @newName NVARCHAR(20)
		DECLARE @oldSalary INT, @newSalary INT
		DECLARE @oldGender NVARCHAR(20), @newGender NVARCHAR(20)
		DECLARE @oldDeptId INT, @newDeptId INT
		DECLARE @auditString NVARCHAR(MAX)

		SELECT *
		INTO #tempTable
		FROM inserted

		WHILE(EXISTS(SELECT Id FROM #tempTable))
		BEGIN
			SET @auditString=''

			SELECT TOP 1 @id=Id, @newName=Name,
				@newGender=Gender, @newSalary=Salary,
				@newDeptId=DepartmentId
			FROM #tempTable

			SELECT @oldName=Name, @oldGender=Gender,
				@oldSalary=Salary, @oldDeptId=DepartmentId
			FROM deleted
			WHERE Id=@id

			SET @auditString='Employee with Id= ' + CAST(@id AS nvarchar(4)) + ' changed'
			IF(@oldName <> @newName)
				SET @auditString = @auditString + ' Name from ' + @oldName + ' to ' + @newName
			IF(@oldGender <> @newGender)
				SET @auditString =@auditString + ' Gender from ' + @oldGender + ' to ' +@newGender
			IF(@oldSalary <> @newSalary)
				SET @auditString =@auditString + ' Salary from ' + CAST(@oldSalary AS nvarchar(10)) + ' to ' + CAST(@newSalary AS nvarchar(10))
			IF(@oldDeptId <> @newDeptId)
				SET @auditString =@auditString + ' DepartmentId from ' + CAST(@oldDeptId AS nvarchar(10)) + ' to ' + CAST(@newDeptId AS nvarchar(10))

			INSERT INTO tblEmployeeAudit VALUES(@auditString)

			DELETE FROM #tempTable WHERE Id=@id
		END
	END;
--End. see videos

--Fifth Try
UPDATE tblEmployee
	SET Name='Todd', Salary=2000, Gender='Female'
	WHERE Id=4;
--End.