--Start Preparation
USE SQLTUTOR;
CREATE TABLE tblEmployee(
	Id INT, Name NVARCHAR(20),
	Gender NVARCHAR(20));

INSERT INTO tblEmployee
	VALUES(1,'Sara','Female'),
		  (2,'John','Male'),
		  (3,'Pam','Female');

SELECT*FROM tblEmployee;
--End Preparation

--Create SP
CREATE PROCEDURE spGetNameById @Id INT
	AS
	BEGIN
		SELECT Name FROM tblEmployee 
		WHERE Id = @Id
	END;
--End

--First Try
SELECT Name FROM tblEmployee WHERE Id=1;
--End. Execution plan(cached) created

--Second Try
SELECT Name FROM tblEmployee WHERE Id=1;
--End. Will use cached from First Try

--Third Try
SELECT Name FROM tblEmployee WHERE Id=2;
--End. Newly cached got created

--Fourth Try
EXECUTE spGetNameById 1;
--End. Execution plan created

--Fifth Try
EXECUTE spGetNameById 2;
--End. Will use execution plan even different parameter

/*
ADVANTAGES OF STORED PROCEDURES
1. Execution plan retention and reusability
2. Reduces network traffic
3. Code reusability and better maintainability
4. Better security
5. Avoids SQL injection attack
*/