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

--Self join with left join
SELECT E.Name AS Employee, M.Name AS Manager
	FROM tblEmployee E
	LEFT JOIN tblEmployee M
	ON E.ManagerID=M.EmployeeID;
--End

--Self join with inner join
SELECT E.Name AS Employee, M.Name AS Manager
	FROM tblEmployee E
	INNER JOIN tblEmployee M
	ON E.ManagerID=M.EmployeeID;
--End

--Self join with cross join
SELECT E.Name AS Employee, M.Name AS Manager
	FROM tblEmployee E
	CROSS JOIN tblEmployee M;
--End