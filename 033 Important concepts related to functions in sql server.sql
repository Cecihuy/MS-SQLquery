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

--Deterministic Function. anytime executed always same result
SQUARE(),POWER(),SUM(),AVG(),COUNT(), and
RAND(1)--with parameter
--All aggregate function are deterministic functions

--Nondeterministic. may return different result eachtime executed
GETDATE(), CURRENT_TIMESTAMP and
RAND()--without parameter

--To create function
CREATE FUNCTION fn_GetNameById(@Id INT)
RETURNS NVARCHAR(30)
AS
BEGIN
	RETURN(
		SELECT Name FROM tblEmployee
		WHERE Id=@Id)
END;
--End

--To see query inside function
sp_helptext fn_GetNameById;
--End

--To alter function with encryption
ALTER FUNCTION fn_GetNameById(@Id INT)
RETURNS NVARCHAR(30)
WITH ENCRYPTION
AS
BEGIN
	RETURN(
		SELECT Name FROM tblEmployee
		WHERE Id=@Id)
END;
--End

--Try again to see query inside function
sp_helptext fn_GetNameById;
--End. cannot see inside because encrypted

--Try delete table
DROP TABLE tblEmployee;
--End. success

--Do preparation once more

--To alter function with schemabinding. must provide exact qualified name with dbo.
ALTER FUNCTION fn_GetNameById(@Id INT)
RETURNS NVARCHAR(30)
WITH SCHEMABINDING
AS
BEGIN
	RETURN(
		SELECT Name FROM dbo.tblEmployee
		WHERE Id=@Id)
END;
--End

--Try delete table
DROP TABLE tblEmployee;
--End. cannot drop table because binding with some function