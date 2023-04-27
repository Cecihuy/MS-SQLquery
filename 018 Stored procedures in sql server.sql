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

--Create store procedure
CREATE PROCEDURE spGetEmployees
AS
BEGIN
	SELECT Name, Gender FROM tblEmployee
END;
--End

--Call store procedure
EXECUTE spGetEmployees;
--End

--Create store procedure with parameter
CREATE PROCEDURE spGetEmployeesByGenderAndDepartment
	@Gender NVARCHAR(20),
	@DepartmentId int
	AS
	BEGIN
		SELECT Name,Gender,DepartmentId FROM tblEmployee
			WHERE Gender=@Gender
			AND DepartmentId=@DepartmentId
	END;
--End

--To execute sp with parameter
EXECUTE spGetEmployeesByGenderAndDepartment 'Male',1;
--End

--Way to execute sp with parameter
EXECUTE spGetEmployeesByGenderAndDepartment @DepartmentId=2, @Gender='Female';
--End

--To view how created sp
SP_HELPTEXT spGetEmployeesByGenderAndDepartment;
--End

--To change store procedure
ALTER PROCEDURE spGetEmployees
	AS
	BEGIN
		SELECT Name, Gender FROM tblEmployee
			ORDER BY Name
	END;
--End

--To delete store procedure
DROP PROCEDURE spGetEmployees;
--End

--To encrypt store procedure
ALTER PROCEDURE spGetEmployeesByGenderAndDepartment
	@Gender NVARCHAR(20),
	@DepartmentId int
	WITH ENCRYPTION
	AS
	BEGIN
		SELECT Name,Gender,DepartmentId FROM tblEmployee
			WHERE Gender=@Gender
			AND DepartmentId=@DepartmentId
	END;
--End

--Try this
SP_HELPTEXT spGetEmployeesByGenderAndDepartment;
--You cannot view the content

SELECT*FROM tblEmployee;
