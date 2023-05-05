--Start Preparation. 
/*
delete all your existing table and their dependency
also delete previous tutorial in this database
*/
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

SELECT*FROM tblGender;
SELECT*FROM tblPerson;
--End Preparation

--First Try
INSERT INTO tblPerson (ID, Name, Email)
	VALUES (7,'Rich','r@r.com');
--End. without supplying GenderId

--Second Try
SELECT*FROM tblPerson;
--End. from First Try query, GenderId return Null

--Third Try
ALTER TABLE tblPerson
	ADD CONSTRAINT DF_tblPerson_GenderId
	DEFAULT 3 FOR GenderId;
--End. create default constraint

--Fourth Try
INSERT INTO tblPerson (ID, Name, Email)
	VALUES (8,'Mike','mike@r.com');
--End. execute Second Try to check. without supplying GenderId, 
--result will be 3 (default constraint called)

--Fifth Try
INSERT INTO tblPerson (ID, Name, Email, GenderId)
	VALUES (9,'Sara','s@r.com', 1);
--End. supplying GenderId, result will be 1. execute Second Try to check

--Sixth Try
INSERT INTO tblPerson (ID, Name, Email, GenderId)
	VALUES (10,'Johnny','j@r.com', NULL);
--End. execute Second Try to check. supplying GenderId with Null, 
--result will be Null (default constraint doesn't called)

--Seventh Try
ALTER TABLE tblPerson
	DROP CONSTRAINT DF_tblPerson_GenderId;
--End. delete default constraint