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
	Age INT);

INSERT INTO tblPerson(ID,Name,Email,GenderId,Age)
	VALUES(1,'Alligator','alligator@mail.org',1,5),
		  (2,'Bull','bull@mail.org',2,17),
		  (3,'Cheetah','cheetah@mail.org',3,25),
		  (4,'Deer','deer@mail.org',1,7),
		  (5,'Eagle','eagle@mail.org',2,18),
		  (6,'Fish','fish@mail.org',3,30);

SELECT*FROM tblPerson;
--End Preparation

--Set check constraint
ALTER TABLE tblPerson
ADD CONSTRAINT CK_tblPerson_Age
CHECK (Age > 0 AND Age <150);
--end

--First try
INSERT INTO tblPerson
VALUES(7,'Sara','s@s.com',2, -34);
--Value of Age cannot be inserted outside of range

--Second try
INSERT INTO tblPerson
VALUES(7,'Sara','s@s.com',2, 34);
--Executed successfull

--Third try
INSERT INTO tblPerson
VALUES(8,'Siri','si@si.com',2, NULL);
--Value of Age will be Null and doesn't trigger check constraint

--Deleting check constraint
ALTER TABLE tblPerson
DROP CONSTRAINT CK_tblPerson_Age;
--End