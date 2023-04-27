USE SQLTUTOR;

CREATE TABLE tblPerson (
	ID INT PRIMARY KEY NOT NULL, 
	Name NVARCHAR(50) NOT NULL, 
	Email NVARCHAR(50) NOT NULL, 
	GenderId INT);

CREATE TABLE tblGender (
	ID INT PRIMARY KEY NOT NULL,
	Gender NVARCHAR(5) NOT NULL);

ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID);