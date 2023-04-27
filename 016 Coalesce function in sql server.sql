--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	ID INT,
	FirstName NVARCHAR(50),
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50));

INSERT INTO tblEmployee
	VALUES(1,'Sam',NULL,NULL),
		  (2,NULL,'Todd','Tanzan'),
		  (3,NULL,NULL,'Sara'),
		  (4,'Ben','Parker',NULL),
		  (5,'James','Nick','Nancy');

SELECT*FROM tblEmployee;
--End Preparation

--Coalesce returns the first NON NULL value
SELECT ID, COALESCE(FirstName,MiddleName,LastName) AS Name
	FROM tblEmployee;
--End
