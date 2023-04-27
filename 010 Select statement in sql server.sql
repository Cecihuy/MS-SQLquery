--Start Preparation
USE SQLTUTOR;

ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK;

DROP TABLE tblGender;
DROP TABLE tblPerson;

CREATE TABLE tblPerson (
	ID INT PRIMARY KEY NOT NULL, 
	Name NVARCHAR(50) NOT NULL, 
	Email NVARCHAR(50) NOT NULL, 
	GenderId INT,
	Age INT,
	City NVARCHAR(50));

INSERT INTO tblPerson(ID,Name,Email,GenderId,Age,City)
	VALUES(1,'Tom','t@t.com',1,23,'London'),
		  (2,'John','j@j.com',1,20,'New York'),
		  (3,'Mary','mary.mary.com',2,21,'Sidney'),
		  (4,'Josh','josh.@dell.com',1,29,'London'),
		  (5,'Sara','sara@abc.com',2,25,'Mumbai');

SELECT*FROM tblPerson;
--End Preparation

--To view all record
SELECT*FROM tblPerson;
--End

--To view all record with fully qualified name for better performance
SELECT ID,Name,Email,GenderId,Age,City
	FROM SQLTUTOR.dbo.tblPerson;
--End

--To view unique result without duplicate
SELECT DISTINCT City 
	FROM tblPerson;
--End

--Try again
SELECT DISTINCT Name, City 
	FROM tblPerson;
--End

--Filtering with WHERE clause
SELECT*FROM tblPerson
	WHERE City='London';
--End

--Try again
SELECT*FROM tblPerson
	WHERE City!='London';
--End

--Filter with OR
SELECT*FROM tblPerson
	WHERE Age=20 OR Age=23 OR Age=29;
--End

--Try again with IN
SELECT*FROM tblPerson
	WHERE AGE IN(20,23,29);
--End

--Filter with BETWEEN
SELECT*FROM tblPerson
	WHERE AGE BETWEEN 20 AND 25;
--End

--Filter with LIKE
SELECT*FROM tblPerson
	WHERE City LIKE 'L%';
--End

--Try again
SELECT*FROM tblPerson
	WHERE Email LIKE '%@%';
--End

--Try again
SELECT*FROM tblPerson
	WHERE Email NOT LIKE '%@%';
--End

--Try with condition one character before @ and one character after @
SELECT*FROM tblPerson
	WHERE Email LIKE '_@_.com';
--Result is two record which is ID 1 and ID 2

--Try with condition Name start with M,S,T
SELECT*FROM tblPerson
	WHERE Email LIKE '[MST]%';
--Result is three record which ID is 1,3 and 5

--Multiple condition
SELECT*FROM tblPerson
	WHERE (City='London' OR City='Mumbai') AND Age > 25;
--Result ID 4

--Sorting by Name ascending
SELECT*FROM tblPerson
	ORDER BY Name;
--End

--Sorting by Name descending
SELECT*FROM tblPerson
	ORDER BY Name DESC;
--End

--Try
SELECT TOP 2 * FROM tblPerson;
--End

--Try
SELECT TOP 2 Name,Email FROM tblPerson;
--End

--Try
SELECT TOP 50 PERCENT Name,Email FROM tblPerson;
--End

--Searching Eldest Age
SELECT TOP 1 * FROM tblPerson
	ORDER BY Age DESC;
--End

/* Operators and Wild Cards

Operator	Purpose

=			Equal to
!= or <>	Not equal to
>			Greater than
>=			Greater than or equal to
<			Less than
<=			Less than or equal to
IN			Specify a list of values
BETWEEN		Specify a range
LIKE		Specify a pattern
NOT			Not in a list, range etc
%			Specifies zero or more characters
_			Specifies exactly one character
[]			Any character with in the brackets
[^]			Not any character with in the brackets

End Comment */