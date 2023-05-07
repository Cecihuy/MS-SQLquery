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

--First Try
WITH EmployeeCount(DepartmentId,TotalEmployees)
AS(
	SELECT DepartmentId,COUNT(*) AS TotalEmloyees
		FROM tblEmployee
		GROUP BY DepartmentId
  )
SELECT DeptName,TotalEmployees
	FROM tblDepartment
	LEFT OUTER JOIN EmployeeCount
	ON tblDepartment.DeptId=EmployeeCount.DepartmentId
	ORDER BY TotalEmployees;
--End. execute CTE

--Second Try
WITH EmployeeCount(DepartmentId,TotalEmployees)
AS(
	SELECT DepartmentId,COUNT(*) AS TotalEmloyees
		FROM tblEmployee
		GROUP BY DepartmentId
  )

SELECT 'HELLO'

SELECT DeptName,TotalEmployees
	FROM tblDepartment
	LEFT OUTER JOIN EmployeeCount
	ON tblDepartment.DeptId=EmployeeCount.DepartmentId
	ORDER BY TotalEmployees;
--End. error, there is a SELECT statement in between.
--SELECT, INSERT, UPDATE, or DELETE statement must immediately follows the CTE

--Third Try
WITH EmployeesCountBy_Payroll_IT_Dept(DepartmentName,Total)
AS(
	SELECT DeptName,COUNT(Id) AS TotalEmployees
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId
		WHERE DeptName IN ('Payroll','IT')
		GROUP BY DeptName
  ),
EmployeesCountBy_HR_Admin_Dept(DepartmentName,Total)
AS(
	SELECT DeptName,COUNT(Id) AS TotalEmployees
		FROM tblEmployee
		LEFT OUTER JOIN tblDepartment
		ON tblEmployee.DepartmentId=tblDepartment.DeptId
		WHERE DeptName IN ('HR','Admin')
		GROUP BY DeptName
  )
SELECT*FROM EmployeesCountBy_HR_Admin_Dept
UNION
SELECT*FROM EmployeesCountBy_Payroll_IT_Dept;
--End. multiple CTE separate by comma,
--UNION treated these two SELECT as one statement