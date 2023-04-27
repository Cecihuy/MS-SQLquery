--Start Preparation
USE SQLTUTOR;

ALTER TABLE tblPerson
	DROP CONSTRAINT tblPerson_GenderId_FK;

DROP TABLE tblGender;
DROP TABLE tblPerson;

CREATE TABLE test1(
	ID INT IDENTITY(1,1),
	Value NVARCHAR(20));

CREATE TABLE test2(
	ID INT IDENTITY(1,1),
	Value NVARCHAR(20));

SELECT*FROM test1;
SELECT*FROM test2;
--End Preparation

--First Try. do twice!!!
INSERT INTO test1
	VALUES('X');
--End

--To know last identity
SELECT SCOPE_IDENTITY();
--End

--Another way to know last identity
SELECT @@IDENTITY;
--End

--Try creating trigger
CREATE TRIGGER trForInsert ON test1 FOR INSERT
AS
BEGIN
	INSERT INTO test2 VALUES('YYYY')
END;
--End

--Second Try
INSERT INTO test1
	VALUES('X');
--End

SELECT*FROM test1;
SELECT*FROM test2;

--Try both
SELECT SCOPE_IDENTITY();
SELECT @@IDENTITY;
--End

--Another way to know last identity
SELECT IDENT_CURRENT('test2');
--End

--lebih jelas dipraktekan bersama vidio