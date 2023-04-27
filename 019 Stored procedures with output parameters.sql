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

--Create procedure with out parameter
CREATE PROCEDURE spGetEmployeeCountByGender
	@Gender NVARCHAR(20),
	@EmployeeCount INT OUTPUT
	AS
	BEGIN
		SELECT @EmployeeCount=COUNT(Id) FROM tblEmployee
			WHERE Gender=@Gender
	END;
--End

--To call procedure with output parameter
DECLARE @TotalCount INT
	EXECUTE spGetEmployeeCountByGender 'Male',@TotalCount OUTPUT
	PRINT	@TotalCount
--End

--Another try without OUTPUT keyword
DECLARE @TotalCount INT
	EXECUTE spGetEmployeeCountByGender 'Male',@TotalCount
		IF(@TotalCount IS NULL)
			PRINT '@TotalCount is null'
		ELSE
			PRINT '@TotalCount is not null'
	PRINT	@TotalCount
--End

--Another try with OUTPUT keyword
DECLARE @TotalCount INT
	EXECUTE spGetEmployeeCountByGender 'Male',@TotalCount OUTPUT
		IF(@TotalCount IS NULL)
			PRINT '@TotalCount is null'
		ELSE
			PRINT '@TotalCount is not null'
	PRINT	@TotalCount
--End

--To view what table depend
SP_DEPENDS spGetEmployeeCountByGender;
--End

--Another SP
SP_HELP spGetEmployeeCountByGender;
--And
SP_HELPTEXT spGetEmployeeCountByGender;
--End
