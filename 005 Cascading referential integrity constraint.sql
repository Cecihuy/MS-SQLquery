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

ALTER TABLE tblPerson
	ADD CONSTRAINT DF_tblPerson_GenderId
	DEFAULT 3 FOR GenderId;

SELECT*FROM tblGender;
SELECT*FROM tblPerson;
--End Preparation

--Set On Delete rule to default
ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK
ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID) ON DELETE SET DEFAULT;
--End

--First Try
DELETE FROM tblGender WHERE ID = 2;
--tblGender entire row will be delete and tblPerson.GenderId will become 3 (default constraint called)

--Set On Delete rule to NULL
ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK
ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID) ON DELETE SET NULL;
--End

--Second Try
DELETE FROM tblGender WHERE ID = 1;
--tblGender entire row will be delete and tblPerson.GenderId will become NULL

--Set On Delete rule to Cascade
ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK
ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID) ON DELETE CASCADE;
--End

--Third Try
DELETE FROM tblGender WHERE ID = 3;
--tblGender entire row will be delete and tblPerson row also deleted