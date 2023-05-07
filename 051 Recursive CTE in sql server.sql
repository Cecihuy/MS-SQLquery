--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	EmployeeId INT,
	Name NVARCHAR(20),
	ManagerId INT);

INSERT INTO tblEmployee
	VALUES(1,'Tom',2),
		  (2,'Josh',NULL),
		  (3,'Mike',2),
		  (4,'John',3),
		  (5,'Pam',1),
		  (6,'Mary',3),
		  (7,'James',1),
		  (8,'Sam',5),
		  (9,'Simon',1);

SELECT*FROM tblEmployee;
--End Preparation

--First Try
SELECT EmpEmp.Name AS [Employee Name],
	ISNULL(ManMan.Name,'Super BOSS') AS [Manager Name]
	FROM tblEmployee EmpEmp
	LEFT JOIN tblEmployee ManMan
	ON EmpEmp.ManagerId = ManMan.EmployeeId;
--End. simple self join

--Second Try
WITH EmployeesCTE(EmployeeId, Name, ManagerId, [Level1])
AS(
	SELECT EmployeeId,Name,ManagerId,1
		FROM tblEmployee
		WHERE ManagerId IS NULL

	UNION ALL

	SELECT tblEmployee.EmployeeId, tblEmployee.Name,
		tblEmployee.ManagerId,EmployeesCTE.[Level1]+1
		FROM tblEmployee
		JOIN EmployeesCTE
		ON tblEmployee.ManagerId=EmployeesCTE.EmployeeId
  )
SELECT EmpCTE.Name AS Employee,
	ISNULL(MgrCTE.Name, 'Super BOSS') AS Manager,
	EmpCTE.[Level1]
	FROM EmployeesCTE EmpCTE
	LEFT JOIN EmployeesCTE MgrCTE
	ON EmpCTE.ManagerId=MgrCTE.EmployeeId;
--End