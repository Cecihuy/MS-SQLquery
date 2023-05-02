--Start Preparation
USE SQLTUTOR;
--End Preparation

--First Try
CREATE TABLE #PersonDetails(
	Id INT,
	Name NVARCHAR(20));
--End. to create temp table

--Second Try
INSERT INTO #PersonDetails
	Values(1,'Mike'),
		  (2,'John'),
		  (3,'Todd');
--End. to insert data to temp table

--Third Try
SELECT*FROM #PersonDetails;
--End. to select all data from temp table, can only use on window(session) that creating temp table
--you cannot use select query from other window(session)

--Fourth Try
SELECT NAME FROM tempdb..sysobjects
	WHERE NAME LIKE '#PersonDetails%';
--End. to see name of temp table

--Fifth Try
DROP TABLE #PersonDetails;
--End. to drop temp table
--if window(session) is closed, temp table is automatically dropped without executing query

--Sixth Try
CREATE PROCEDURE spCreateLocalTempTable
AS
BEGIN
	CREATE TABLE #PersonDetails(
		Id INT, 
		Name NVARCHAR(20))
	INSERT INTO #PersonDetails
		VALUES(1,'Mike'),
			  (2,'John'),
			  (3,'Todd')
	SELECT*FROM #PersonDetails
END;
--End. create procedure

--Seventh Try
EXECUTE spCreateLocalTempTable;
--End. it will return table but imediately destroyed upon completion sp execution

--Eight Try. try again all above with ## global temporary tables

/*
Difference between local and global temporary tables:
1.	Local temp tables are prefixed with single pound(#) hash symbol,
	where as global temp tables are prefixed with 2 pound(##).
2.	SQL Server appends some random numbers at the end of the local temp
	table name, where this is not done for global temp table names.
3.	Local temporary tables are only visible to that session of the 
	SQL Server which has created it, where as global temporary tables
	are visible to all the SQL server sessions.
4.	Local temporary tables are automatically dropped when the session
	that created the temporary tables is closed, where as global temporary
	tables are destroyed when the last connection that is referencing the
	global temp table is closed.
*/