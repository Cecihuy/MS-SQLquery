--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblPerson (
	ID INT PRIMARY KEY NOT NULL, 
	Name NVARCHAR(50) NOT NULL, 
	Email NVARCHAR(50) NOT NULL, 
	GenderId INT);

INSERT INTO tblPerson(ID,Name,Email,GenderId)
	VALUES(1,'Alligator','alligator@mail.org',1),
		  (2,'Bull','bull@mail.org',2),
		  (3,'Cheetah','cheetah@mail.org',3),
		  (4,'Deer','deer@mail.org',1),
		  (5,'Eagle','eagle@mail.org',2),
		  (6,'Fish','fish@mail.org',3);

CREATE TABLE tblGender(
	ID INT PRIMARY KEY NOT NULL,
	Gender NVARCHAR(50) NOT NULL);

INSERT INTO tblGender(ID,Gender)
	VALUES(1,'Male'),
		  (2,'Female'),
		  (3,'Unknown');

ALTER TABLE tblPerson
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID);

ALTER TABLE tblPerson
	ADD CONSTRAINT DF_tblPerson_GenderId
	DEFAULT 3 FOR GenderId;

SELECT*FROM tblGender;
SELECT*FROM tblPerson;
--End Preparation

--First Try
ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK
ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID) ON DELETE SET DEFAULT;
--End. set On Delete rule to Default

--Second Try
SELECT*FROM tblGender;
SELECT*FROM tblPerson;
--End.

--Third Try. pay attention before execute this query
DELETE FROM tblGender WHERE ID = 2;
--End. tblGender with ID=2 entire row will be delete and tblPerson.GenderId 
--will become 3 (default constraint called). execute Second Try to check

--Fourth Try
ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK
ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID) ON DELETE SET NULL;
--End. set On Delete rule to NULL. execute Second Try

--Fifth Try. pay attention before execute this querry
DELETE FROM tblGender WHERE ID = 1;
--End. tblGender with ID=1 entire row will be delete 
--and tblPerson.GenderId will become NULL. execute Second Try to check

--Sixth Try
ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK
ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID) ON DELETE CASCADE;
--End. set On Delete rule to Cascade. execute Second Try

--Seventh Try. pay attention before execute this querry
DELETE FROM tblGender WHERE ID = 3;
--End. tblGender with ID=3 entire row will be delete 
--and tblPerson.GenderId entire row also deleted. execute Second Try to check