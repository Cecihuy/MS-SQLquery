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

--Try this
SELECT ISDATE('PRAGIM'); --returns 0
SELECT ISDATE(GETDATE()); --returns 1
SELECT ISDATE('2012-08-31 21:02:04.167'); --returns 1
SELECT ISDATE('2012-08-31 21:02:04.1672321'); --returns 0

--Try
SELECT DAY(GETDATE()); --returns the current date day number of the month
SELECT DAY('01/31/2012'); --RETURNS 31

--More
SELECT MONTH(GETDATE()); --returns the current date, month  number of the year
SELECT MONTH('01/31/2012'); --returns 1

--Again
SELECT YEAR(GETDATE()); --returns the current date the year number
SELECT YEAR('01/31/2012'); --returns 2012

--Another
SELECT DATENAME(DAY, '2012-09-30 12:43:46.837'); --returns 30
SELECT DATENAME(WEEKDAY, '2012-09-30 12:43:46.837'); --returns sunday
SELECT DATENAME(MONTH, '2012-09-30 12:43:46.837'); --returns september

--First Try
SELECT Name, DateOfBirth,DATENAME(WEEKDAY,DateOfBirth)AS Day,
	MONTH(DateOfBirth)AS MonthNumber,
	DATENAME(MONTH,DateOfBirth)AS MonthName,
	YEAR(DateOfBirth)AS Year
	FROM tblEmployee;
--End. yea you got it!!!