--Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	EmployeeID INT,
	Name NVARCHAR(50),
	ManagerID INT);

INSERT INTO tblEmployee
	VALUES(1,'Mike',3),
		  (2,'Rob',1),
		  (3,'Todd',NULL),
		  (4,'Ben',1),
		  (5,'Sam',1);

SELECT*FROM tblEmployee;
--End Preparation

--Try
SELECT ISNULL('Pragim','No Manager') AS Manager;
--End

--Try
SELECT ISNULL(NULL,'No Manager') AS Manager;
--End

--Try
SELECT COALESCE ('Pragim','No Manager') AS Manager;
--End

--Try
SELECT COALESCE (NULL,'No Manager') AS Manager;
--End

--CASE WHEN Expression THEN '' ELSE '' END

--Replacing NULL with value
SELECT E.Name AS Employee, ISNULL(M.Name,'No Manager') AS Manager
	FROM tblEmployee E
	LEFT JOIN tblEmployee M
	ON E.ManagerID=M.EmployeeID;
--End

--Replacing NULL with value using coalesce
SELECT E.Name AS Employee, COALESCE(M.Name,'No Manager') AS Manager
	FROM tblEmployee E
	LEFT JOIN tblEmployee M
	ON E.ManagerID=M.EmployeeID;
--End

--Replacing NULL with value using CASE
SELECT E.Name AS Employee, CASE WHEN M.Name IS NULL THEN 'No Manager' ELSE M.Name END AS Manager
	FROM tblEmployee E
	LEFT JOIN tblEmployee M
	ON E.ManagerID=M.EmployeeID;
--End