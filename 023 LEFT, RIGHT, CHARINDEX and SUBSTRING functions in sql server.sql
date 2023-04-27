--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee (
	ID INT, 
	Name NVARCHAR(50), 
	Email NVARCHAR(50));

INSERT INTO tblEmployee
	VALUES(1,'Alligator','alligator@mail.org'),
		  (2,'Bull','bull@box.org'),
		  (3,'Cheetah','cheetah@letter.org'),
		  (4,'Deer','deer@box.org'),
		  (5,'Eagle','eagle@letter.org'),
		  (6,'Fish','fish@letter.org');

SELECT*FROM tblEmployee;
--End Preparation

--First Try
SELECT LEFT('ABCDEF',3);
--End. return first three characters ABC from ABCDEF

--Second Try
SELECT RIGHT('ABCDEF',2);
--End. return last two characters EF from ABCDEF

--Third Try
SELECT CHARINDEX('@','sara@aaa.com');
--End. return int starting index of char @ from sara@aaa.com

--Fourth Try
SELECT SUBSTRING('sara@aaa.com',3,4);
--End. return string ra@a from sara@aaa.com. 3 as starting index, 4 as how many chars needed

--Fifth Try
SELECT SUBSTRING('sara@aaa.com',CHARINDEX('@','sara@aaa.com') + 1,99);
--End. return get only domain name aaa.com . +1 for eliminating @ symbol. 99 is hard coded for geting all remain chars after @ symbol

--Sixth Try
SELECT SUBSTRING('sara@aaa.com',CHARINDEX('@','sara@aaa.com') + 1,
	LEN('sara@aaa.com') - CHARINDEX('@','sara@aaa.com'));
--End. return get only domain name aaa.com dynamically without hard codding

--Seventh Try
SELECT SUBSTRING(Email,CHARINDEX('@',Email) + 1,
	LEN(Email) - CHARINDEX('@',Email))
	AS EmailDomain
	FROM tblEmployee;
--End. return get only domain name implementing from Email field of tblEmployee

--Eight Try
SELECT SUBSTRING(Email,CHARINDEX('@',Email) + 1,
	LEN(Email) - CHARINDEX('@',Email)) AS EmailDomain,
	COUNT(Email) AS Total
	FROM tblEmployee
	GROUP BY
		SUBSTRING(Email,CHARINDEX('@',Email) + 1,
		LEN(Email) - CHARINDEX('@',Email));
--End. see result