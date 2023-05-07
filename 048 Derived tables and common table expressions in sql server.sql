--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblEmployee(
	Id INT,
	Name NVARCHAR(20),
	Gender NVARCHAR(20),
	DepartmentId INT);

INSERT INTO tblEmployee
	VALUES(1,'John','Male',3),
		  (2,'Mike','Male',2),
		  (3,'Pam','Female',1),
		  (4,'Todd','Male',4),
		  (5,'Sara','Female',1),
		  (6,'Ben','Male',3);

CREATE TABLE tblDepartment(
	DeptId INT,
	DeptName NVARCHAR(20));


INSERT INTO tblDepartment
	VALUES(1,'IT'),
		  (2,'Payroll'),
		  (3,'HR'),
		  (4,'Admin');

SELECT*FROM tblEmployee;
SELECT*FROM tblDepartment;
--End Preparation

--Firts Try
CREATE VIEW vwEmployeeCount
AS
	SELECT DeptName,DepartmentId,COUNT(*) AS TotalEmployees
		FROM tblEmployee
		JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId
		GROUP BY DeptName,DepartmentId;
--End. create views

--Second Try
SELECT*FROM vwEmployeeCount;
--End.

--Third Try
SELECT DeptName, TotalEmployees
	FROM vwEmployeeCount
	WHERE TotalEmployees >= 2;
--End. this is final result to achieve

--Fourth Try
SELECT DeptName,DepartmentId,COUNT(*) AS TotalEmployees
	INTO #TempEmployeeCount
	FROM tblEmployee
	JOIN tblDepartment
	ON tblEmployee.DepartmentId=tblDepartment.DeptId
	GROUP BY DeptName, DepartmentId;
--End. create local temp tables

--Fifth Try
SELECT*FROM #TempEmployeeCount;
--End.

--Sixth Try
SELECT DeptName, TotalEmployees
	FROM #TempEmployeeCount
	WHERE TotalEmployees >=2;
--End. same result using local temp tables instead views

--Seventh Try
DROP TABLE #TempEmployeeCount;
--End. delete temp tables

--Eight Try
DECLARE @tblEmployeeCount TABLE(
	DeptName NVARCHAR(20),
	DepartmenId INT,
	TotalEmployees INT)

INSERT @tblEmployeeCount
	SELECT DeptName,DepartmentId,COUNT(*) AS TotalEmployees
		FROM tblEmployee
		JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId
		GROUP BY DeptName, DepartmentId

SELECT DeptName, TotalEmployees
	FROM @tblEmployeeCount
	WHERE TotalEmployees >= 2;
--End. same result with variable tables. we don't have to drop any tables

--Ninth Try
SELECT DeptName, TotalEmployees
	FROM(
		SELECT DeptName,DepartmentId,COUNT(*) AS TotalEmployees
			FROM tblEmployee
			JOIN tblDepartment
			ON tblEmployee.DepartmentId=tblDepartment.DeptId
			GROUP BY DeptName, DepartmentId
		)
	AS EmployeeCount
	WHERE TotalEmployees >= 2;
--End. same result using derived tables

--Tenth Try
WITH EmployeeCount(DeptName, DepartmentId, TotalEmployees)
AS  (
	SELECT DeptName,DepartmentId,COUNT(*) AS TotalEmployees
		FROM tblEmployee
		JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId
		GROUP BY DeptName, DepartmentId
	)
SELECT DeptName, TotalEmployees
	FROM EmployeeCount
	WHERE TotalEmployees >= 2;
--End. same result using CTE