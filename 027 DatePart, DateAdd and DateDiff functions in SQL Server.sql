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

--Example
SELECT DATEPART(WEEKDAY, '2012-08-30 19:45:31.793'); --returns 5
SELECT DATENAME(WEEKDAY, '2012-08-30 19:45:31.793'); --returns Thursday
--End.

--Example
SELECT DATEADD(DAY,20,'2012-08-30 19:45:31.793'); --returns 2012-09-19 19:45:31.793
SELECT DATEADD(DAY,-20,'2012-08-30 19:45:31.793'); --returns 2012-08-10 19:45:31.793
--End.

--Example
SELECT DATEDIFF(MONTH, '11/30/2005','01/31/2006'); --returns 2
SELECT DATEDIFF(DAY, '11/30/2005','01/31/2006'); --returns 62
--End.

--Start Create Function
CREATE FUNCTION fnComputeAge(@DOB DateTime)
	RETURNS NVARCHAR(50)
	AS
	BEGIN

DECLARE 
	@tempDate DATETIME,
	@years INT,
	@months INT,
	@days INT

SET @DOB = '10/08/1982'

SELECT @tempDate = @DOB

SELECT @years = DATEDIFF(YEAR,@tempDate,GETDATE()) -
				CASE
					WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
						 (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
					THEN 1 ELSE 0
				END

SELECT @tempDate = DATEADD(YEAR,@years,@tempDate)

SELECT @months = DATEDIFF(MONTH,@tempDate, GETDATE()) -
				 CASE
					WHEN DAY(@DOB) > DAY(GETDATE())
					THEN 1 ELSE 0
				 END

SELECT @tempDate = DATEADD(MONTH,@months,@tempDate)

SELECT @days = DATEDIFF(DAY,@tempDate, GETDATE())

DECLARE @Age NVARCHAR(50)
SET @Age = CAST(@years AS nvarchar(4)) + ' Years ' + CAST(@months AS nvarchar(2)) + ' Months ' + CAST(@days AS nvarchar(2))+ ' Days Old'

RETURN @Age

END;

--End Creating Function

SELECT dbo.fnComputeAge('11/30/2005');

SELECT Id, Name, DateOfBirth, dbo.fnComputeAge(DateOfBirth) AS Age
	FROM tblEmployee;
