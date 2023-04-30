--Start Preparation
CREATE TABLE tblEmployee(
	Id INT,
	Name NVARCHAR(20),
	DateOfBirth DATETIME);

INSERT INTO tblEmployee
	VALUES(1,'Sam','1980-12-30 00:00:00.000'),
		  (2,'Pam','1982-09-01 12:02:36.260'),
		  (3,'John','1985-08-22 12:03:30.370'),
		  (4,'Sara','1979-11-29 12:59:30.670');

SELECT*FROM tblEmployee;
--End Preparation

--Start create function
CREATE FUNCTION CalculateAge(@DOB DATE)
RETURNS INT
AS
BEGIN
	DECLARE @Age INT
	SET @Age=DATEDIFF(YEAR,@DOB,GETDATE()) -
		CASE
			WHEN(MONTH(@DOB) > MONTH(GETDATE())) OR
				(MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
			THEN 1 
			ELSE 0
		END
	RETURN @Age
END;
--End create function

--First Try
SELECT dbo.CalculateAge('07/13/1976') AS AGE;
--End

--Second Try
SELECT Id,Name, dbo.CalculateAge(DateOfBirth) AS Age
	FROM tblEmployee;
--End

--Third Try
SELECT Id,Name, dbo.CalculateAge(DateOfBirth) AS Age
	FROM tblEmployee
	WHERE dbo.CalculateAge(DateOfBirth) > 40;
--End

--Start create procedure
CREATE PROCEDURE spCalculateAge @DOB DATE
AS
BEGIN
	DECLARE @Age INT
	SET @Age=DATEDIFF(YEAR,@DOB,GETDATE()) -
		CASE
			WHEN(MONTH(@DOB) > MONTH(GETDATE())) OR
				(MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
			THEN 1 
			ELSE 0
		END
	SELECT @Age
END;
--End create prosedur

--Fourth Try
EXECUTE spCalculateAge '07/13/1976';
--End. store procedure cannot be implement with SELECT and WHERE clause. You can try it like Third Try