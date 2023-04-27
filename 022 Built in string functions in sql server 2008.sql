--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee (
	ID INT, 
	FirstName NVARCHAR(50),
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50));

INSERT INTO tblEmployee
	VALUES(1,' Alligator      ','Buaya','Darat'),
		  (2,'  Bull     ','Banteng','Merah'),
		  (3,'   Cheetah    ','Macan','Tulul'),
		  (4,'    Deer   ','Kambing','Ehbukan'),
		  (5,'     Eagle  ','Elang','Botak'),
		  (6,'      Fish ','Ikan','Amis');

SELECT*FROM tblEmployee;
--End Preparation

--First Try
SELECT ASCII('A');
--End. return int 65

--Second Try
SELECT ASCII('ABC');
--End. return int 65. only read first character

--Third Try
SELECT CHAR(65);
--End. return char A

--Fourth Try
Declare @start int
	SET @start = 65
	WHILE(@start <= 90)
	BEGIN
		PRINT CHAR(@start)
		SET @start = @start + 1
	END;
--End. return alphabeth upcase A-Z

--Fifth Try
SELECT LTRIM('     Hello');
--End. return Hello word without whitespace

--Six Try
SELECT LTRIM(FirstName) AS FirstName, MiddleName, LastName	FROM tblEmployee;
--End.

--Seventh Try
SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS [Full Name] FROM tblEmployee;
--End. return Full Name but still whitespace come from FirstName

--Eighth Try
SELECT LTRIM(RTRIM(FirstName)) + ' ' + MiddleName + ' ' + LastName AS [Full Name] FROM tblEmployee;
--End. return fixed whitespace

--ninth Try
SELECT UPPER(FirstName) AS FirstName,LOWER(MiddleName) AS MiddleName FROM tblEmployee;
--End. return FirstName all upcase and Middlename all lowcase

--Tenth Try
SELECT REVERSE(FirstName) AS FirstName FROM tblEmployee;
--End. return FirstName reverse data order

--Eleventh Try
SELECT FirstName, LEN(FirstName) AS TotalCharacters FROM tblEmployee;
--End. return total characters of FirstName include whitespaces before data, but exclude whitespaces after data