--First Try
USE SQLTUTOR;
--End. changing database to use with SQLTUTOR

--Second Try
CREATE TABLE tblPerson (
	ID INT PRIMARY KEY NOT NULL, 
	Name NVARCHAR(50) NOT NULL, 
	Email NVARCHAR(50) NOT NULL, 
	GenderId INT);
--End. creating table

--Third Try
CREATE TABLE tblGender (
	ID INT PRIMARY KEY NOT NULL,
	Gender NVARCHAR(5) NOT NULL);
--End. creating table

--Fourth Try
ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderId_FK
	FOREIGN KEY (GenderId) REFERENCES tblGender(ID);
--End. add foreign key on existing table