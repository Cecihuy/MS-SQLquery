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

--First try
INSERT INTO tblPerson (ID, Name, Email)
	VALUES (7,'Rich','r@r.com');
--Without supplying GenderId, result will be Null

--Create default constraint
ALTER TABLE tblPerson
	ADD CONSTRAINT DF_tblPerson_GenderId
	DEFAULT 3 FOR GenderId;
--End

--Second Try
INSERT INTO tblPerson (ID, Name, Email)
	VALUES (8,'Mike','mike@r.com');
--Without supplying GenderId, result will be 3 (default constraint called)

--Third Try
INSERT INTO tblPerson (ID, Name, Email, GenderId)
	VALUES (9,'Sara','s@r.com', 1);
--With supplying GenderId, result will be 1

--Fourth Try
INSERT INTO tblPerson (ID, Name, Email, GenderId)
	VALUES (10,'Johnny','j@r.com', NULL);
--Supplying GenderId with Null, result will be Null (default constraint doesn't called)

--Delete default constraint
ALTER TABLE tblPerson
	DROP CONSTRAINT DF_tblPerson_GenderId;
--End
