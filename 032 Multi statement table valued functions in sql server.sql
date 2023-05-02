--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	Id INT,
	Name NVARCHAR(20),
	DateOfBirth DATETIME,
	Gender NVARCHAR(20),
	DepartmentId INT);

INSERT INTO tblEmployee
	VALUES(1,'Sam','1980-12-30 00:00:00.000','Male',1),
		  (2,'Pam','1982-09-01 12:02:36.260','Female',2),
		  (3,'John','1985-08-22 12:03:30.370','Male',1),
		  (4,'Sara','1979-11-29 12:59:30.670','Female',3),
		  (5,'Todd','1978-11-29 12:59:30.670','Male',1);

SELECT*FROM tblEmployee;
--End Preparation

--Start create function inline table
CREATE FUNCTION fn_ILTVF_GetEmployee()
RETURNS TABLE
AS
RETURN(
	SELECT Id, Name, CAST(DateOfBirth AS DATE) AS DOB
	FROM tblEmployee);
--End. 

--Try Call
SELECT*FROM dbo.fn_ILTVF_GetEmployee();
--End

--Start create fucntion multi statement table
CREATE FUNCTION fn_MSTVF_GetEmployee()
RETURNS @table TABLE (Id INT, Name NVARCHAR(20), DOB DATE)
AS
BEGIN
	INSERT INTO @table
	SELECT Id,Name,CAST(DateOfBirth AS DATE) FROM tblEmployee
	RETURN
END;
--End.

--Try Call
SELECT*FROM dbo.fn_MSTVF_GetEmployee();
--End

--Try updating data through inline table function
UPDATE fn_ILTVF_GetEmployee()
	SET Name='Sam1' WHERE Id=1;
--End. return update succees

--Try updating data through multistatement table function
UPDATE fn_MSTVF_GetEmployee()
	SET Name='Sam' WHERE Id=1;
--End. return error because there have some variable