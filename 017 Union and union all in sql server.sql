--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblIndiaCustomers(
	Id INT,
	Name NVARCHAR(50),
	Email NVARCHAR(50));

INSERT INTO tblIndiaCustomers
	VALUES(1,'Raj','R@R.com'),
		  (2,'Sam','S@S.com');

CREATE TABLE tblUKCustomers(
	Id INT,
	Name NVARCHAR(50),
	Email NVARCHAR(50));

INSERT INTO tblUKCustomers
	VALUES(1,'Ben','B@B.com'),
		  (2,'Sam','S@S.com');

SELECT*FROM tblIndiaCustomers;
SELECT*FROM tblUKCustomers;
--End Preparation

--First Try
SELECT*FROM tblIndiaCustomers
	UNION ALL
	SELECT*FROM tblUKCustomers;
--End

--Second Try
SELECT*FROM tblIndiaCustomers
	UNION
	SELECT*FROM tblUKCustomers;
--End
