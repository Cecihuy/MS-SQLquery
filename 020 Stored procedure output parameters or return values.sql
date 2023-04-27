--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	Id INT,
	Name NVARCHAR(50),
	Gender NVARCHAR(50),
	DepartmentId NVARCHAR(50));

INSERT INTO tblEmployee
	VALUES(1,'Sam','Male',1),
		  (2,'Ram','Male',1),
		  (3,'Sara','Female',3),
		  (4,'Todd','Male',2),
		  (5,'John','Male',3),
		  (6,'Sana','Female',2),
		  (7,'James','Male',1),
		  (8,'Rob','Male',2),
		  (9,'Steve','Male',1),
		  (10,'Pam','Female',2);

SELECT*FROM tblEmployee;
--End Preparation

--Create
CREATE PROCEDURE spGetTotalCount1
	@TotalCount INT OUTPUT
	AS
	BEGIN
		SELECT @TotalCount=COUNT(Id) FROM tblEmployee
	END
--End

--Call
DECLARE @Total INT
	EXECUTE spGetTotalCount1 @Total OUTPUT
	PRINT @Total;
--End

--Create procedure with return
CREATE PROCEDURE spGetTotalCount2	
	AS
	BEGIN
		RETURN (SELECT COUNT(Id) FROM tblEmployee)
	END
--End

--Call
DECLARE @Total INT
	EXECUTE @Total=spGetTotalCount2
	PRINT @Total;
--End