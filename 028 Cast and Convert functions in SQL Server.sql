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

CREATE TABLE tblRegistration(
	Id INT,
	Name NVARCHAR(20),
	Email NVARCHAR(20),
	RegisteredDate DATETIME);

INSERT INTO tblRegistration
	VALUES(1,'John','j@j.com','2012-08-24 11:04:30.230'),
		  (2,'Sam','s@s.com','2012-08-25 14:04:29.780'),
		  (3,'Todd','t@t.com','2012-08-25 15:04:29.780'),
		  (4,'Mary','m@m.com','2012-08-24 15:04:30.730'),
		  (5,'Sunil','sunil@s.com','2012-08-24 15:05:30.330'),
		  (6,'Mike','mike@m.com','2012-08-26 15:05:30.330');

SELECT*FROM tblEmployee;
SELECT*FROM tblRegistration;
--End Preparation

--First Try
SELECT Id, Name, DateOfBirth,
	CAST(DateOfBirth AS NVARCHAR) 
	AS ConvertedDOB FROM tblEmployee;
--End.

--Second Try
SELECT Id, Name, DateOfBirth,
	CONVERT(NVARCHAR, DateOfBirth) 
	AS ConvertedDOB FROM tblEmployee;
--End.

--Third Try
SELECT Id,Name,DateOfBirth,
	CONVERT(NVARCHAR,DateOfBirth,103)
	AS ConvertedDOB FROM tblEmployee;
--End. 103 values style come from msdn

--Fourth Try
SELECT CONVERT(VARCHAR(10),GETDATE(),101);
--End. return 04/29/2023

--Fifth Try
SELECT CAST(GETDATE() AS DATE);
SELECT CONVERT(DATE,GETDATE());
--End. introduce newer sql version

--Sixt Try
SELECT Id,Name,Name +' - ' + CAST(Id AS nvarchar) 
	AS [Name - Id]
	FROM tblEmployee;
--End

SELECT*FROM tblRegistration;

--Seventh Try
SELECT CAST(RegisteredDate AS DATE)AS RegistrationDate,
	COUNT(Id) AS TotalRegistrations
	FROM tblRegistration
	GROUP BY CAST(RegisteredDate AS DATE);
--End

--Eight
SELECT RegisteredDate AS RegistrationDate,
	COUNT(Id) AS TotalRegistrations
	FROM tblRegistration
	GROUP BY RegisteredDate;