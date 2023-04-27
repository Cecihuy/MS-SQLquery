--Start Preparation
USE SQLTUTOR;

ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK;

DROP TABLE tblGender;
DROP TABLE tblPerson;
DROP TABLE test1;
DROP TABLE test2;

CREATE TABLE tblPerson (
	ID INT PRIMARY KEY NOT NULL, 
	Name NVARCHAR(50) NOT NULL, 
	Email NVARCHAR(50) NOT NULL, 
	GenderId INT,
	Age INT);

SELECT*FROM tblPerson;
--End Preparation

--Create unique key
ALTER TABLE tblPerson
	ADD CONSTRAINT UQ_tblPerson_Email 
	UNIQUE(Email);
--End

--First Try
INSERT INTO tblPerson
	VALUES(1,'ABC','a@a.com',1,20);
--End

--Second Try
INSERT INTO tblPerson
	VALUES(2,'XYZ','a@a.com',1,20);
--Error cannot insert because there already same email name. must unique

--To delete unique key
ALTER TABLE tblPerson
	DROP CONSTRAINT UQ_tblPerson_Email;
--End

--Third Try
INSERT INTO tblPerson
	VALUES(2,'XYZ','a@a.com',1,20);
--End with success