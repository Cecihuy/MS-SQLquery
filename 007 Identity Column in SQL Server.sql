--Start Preparation
USE SQLTUTOR;

ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK;

DROP TABLE tblGender;
DROP TABLE tblPerson;
--End Preparation

--Create table with identity
CREATE TABLE tblPerson (
	PersonId INT IDENTITY(1,1) PRIMARY KEY, 
	Name NVARCHAR(50));
--End

--First Try
INSERT INTO tblPerson
	VALUES('John');
--No need to supply PersonId because it fill automatically

--Check
SELECT*FROM tblPerson;
--End

--Second Try
INSERT INTO tblPerson
	VALUES('Tom'),
		  ('Sara');
--End

--Try delete one row
DELETE FROM tblPerson
	WHERE PersonId=1;
--End

--Third Try
INSERT INTO tblPerson
	VALUES('Todd');
--PersonId value is get continued. Result is 4

--Fourth Try
INSERT INTO tblPerson
	VALUES(1,'Jane');
--Error cannot insert PersonId. Explicit value can be inserted with IDENTITY_INSERT is ON.

--Turn on explicit identity insert
SET IDENTITY_INSERT tblPerson ON;
--End

--Fifth Try
INSERT INTO tblPerson(PersonId,Name)
	VALUES(1,'Jane');
--Must fill complete with column name

--Turn off explicit identity insert
SET IDENTITY_INSERT tblPerson OFF;
--End

--Sixth Try
INSERT INTO tblPerson
	VALUES('Martin');
--It continued

--Try deleting all record
DELETE FROM tblPerson;
--End

--Seventh Try
INSERT INTO tblPerson
	VALUES('Martin');
--PersonId value still continued to 6

--Try deleting all record
DELETE FROM tblPerson;
--End

--To reset identity value
DBCC CHECKIDENT('tblPerson',RESEED,0);
--End

--Eight Try
INSERT INTO tblPerson
	VALUES('Martin');
--PersonId value reset to 1

SELECT*FROM tblPerson;

