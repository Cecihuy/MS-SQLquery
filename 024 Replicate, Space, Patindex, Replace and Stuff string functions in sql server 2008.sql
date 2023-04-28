--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee (
	ID INT, 
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Email NVARCHAR(50));

INSERT INTO tblEmployee
	VALUES(1,'Alligator','Buaya','alligator@mail.org'),
		  (2,'Bull','Banteng','bull@box.org'),
		  (3,'Cheetah','Macan','cheetah@letter.org'),
		  (4,'Deer','Kambing','deer@box.org'),
		  (5,'Eagle','Elang','eagle@box.org'),
		  (6,'Fish','Ikan','fish@letter.org');

SELECT*FROM tblEmployee;
--End Preparation

--First Try
SELECT REPLICATE('Pragim ',3);
--End. return Pragim Pragim Pragim

--Second Try
SELECT FirstName, LastName,
	SUBSTRING(Email,1,2)+REPLICATE('*',5)+
	SUBSTRING(Email,CHARINDEX('@',Email),LEN(Email)-CHARINDEX('@',Email)+1)
	AS Email
	FROM tblEmployee;
--End. return Email with format al*****@mail.org

--Third Try
SELECT '     ';
--End. return 5 space with hardcoded

--Fourth Try
SELECT SPACE(5);
--End. return 5 space with readable code

--Fifth Try
SELECT FirstName + SPACE(3) + LastName
	AS FullName FROM tblEmployee;
--End. return FullName with 3 whitespaces between FirstName and LastName

--Sixth Try
SELECT Email, PATINDEX('%box.org',Email)AS FirstOccurence
	FROM tblEmployee
	WHERE PATINDEX('%box.org',Email) > 0;
--End.return all email with domain box.org and their respective starting index

--Seventh Try
SELECT Email, REPLACE(Email,'.org','.net')
	AS ConvertedEmail
	FROM tblEmployee;
--End. return Email with replacing .org to .net

--Eight Try
SELECT Email, STUFF(Email,2,4,'*****')
	AS StuffedEmail FROM tblEmployee;
--End. see result