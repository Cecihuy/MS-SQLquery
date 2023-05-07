--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblProductSales(
	SalesAgent NVARCHAR(20),
	SalesCountry NVARCHAR(20),
	SalesAmount INT);

INSERT INTO tblProductSales
	VALUES('Tom','UK',200),
		  ('John','US',180),
		  ('John','UK',260),
		  ('David','India',450),
		  ('Tom','India',350),
		  ('David','US',200),
		  ('Tom','US',130),
		  ('John','India',540),
		  ('John','UK',120),
		  ('David','UK',220),
		  ('John','UK',420),
		  ('David','US',320),
		  ('Tom','US',340),
		  ('Tom','UK',660),
		  ('John','India',430),
		  ('David','India',230),
		  ('David','India',280),
		  ('Tom','UK',480),
		  ('John','US',360),
		  ('David','UK',140);

CREATE TABLE tblProductSalesWithId(
	Id INT,
	SalesAgent NVARCHAR(20),
	SalesCountry NVARCHAR(20),
	SalesAmount INT);

INSERT INTO tblProductSalesWithId
	VALUES(1,'Tom','UK',200),
		  (2,'John','US',180),
		  (3,'John','UK',260),
		  (4,'David','India',450),
		  (5,'Tom','India',350),
		  (6,'David','US',200),
		  (7,'Tom','US',130),
		  (8,'John','India',540),
		  (9,'John','UK',120),
		  (10,'David','UK',220),
		  (11,'John','UK',420),
		  (12,'David','US',320),
		  (13,'Tom','US',340),
		  (14,'Tom','UK',660),
		  (15,'John','India',430),
		  (16,'David','India',230),
		  (17,'David','India',280),
		  (18,'Tom','UK',480),
		  (19,'John','US',360),
		  (20,'David','UK',140);

SELECT*FROM tblProductSales;

SELECT*FROM tblProductSalesWithId;
--End Preparation

--First Try
SELECT SalesCountry,SalesAgent,
	SUM(SalesAmount) AS Total
	FROM tblProductSales
	GROUP BY SalesCountry,SalesAgent
	ORDER BY SalesCountry,SalesAgent;
--End. group by query

--Second Try
SELECT SalesAgent,India,US,UK
	FROM tblProductSales
	PIVOT(
		SUM(SalesAmount)
		FOR SalesCountry
		IN ([India],[US],[UK])
		 )
	AS PivotTable
--End. query using pivot operator

--Third Try
SELECT SalesAgent,India,US,UK
	FROM (
		SELECT SalesAgent, SalesCountry, SalesAmount
		FROM tblProductSalesWithId
		 )
	AS SourceTable
	PIVOT(
		SUM(SalesAmount)
		FOR SalesCountry
		IN ([India],[US],[UK])
		 )
	AS PivotTable
--End. modification query if Id got present