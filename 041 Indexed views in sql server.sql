--Start Preparation
CREATE TABLE tblProduct(
	ProductId INT,
	Name NVARCHAR(20),
	UnitPrice INT);

INSERT INTO tblProduct
	VALUES(1,'Books',20),
		  (2,'Pens',14),
		  (3,'Pencils',11),
		  (4,'Clips',10);

CREATE TABLE tblProductSales(
	ProductId INT,
	QuantitySold INT);

INSERT INTO tblProductSales
	VALUES(1,10),
		  (3,23),
		  (4,21),
		  (2,12),
		  (1,13),
		  (3,12),
		  (4,13),
		  (1,11),
		  (2,12),
		  (1,14);

SELECT*FROM tblProduct;
SELECT*FROM tblProductSales;
--End Preparation

--First Try
CREATE VIEW vwTotalSalesByProduct
WITH SCHEMABINDING
AS
	SELECT Name,
		SUM(ISNULL((QuantitySold*UnitPrice),0)) AS TotalSales,
		COUNT_BIG(*) AS TotalTransactions
		FROM dbo.tblProduct
		INNER JOIN dbo.tblProductSales
		ON dbo.tblProduct.ProductId=dbo.tblProductSales.ProductId
		GROUP BY Name;
--End.

--Second Try
SELECT*FROM vwTotalSalesByProduct;
--End

--Third Try
CREATE UNIQUE CLUSTERED INDEX UIX_vwTotalSalesByProduct_Name
	ON vwTotalSalesByProduct(Name);
--End.

/*
Guidelines for creating Indexed Views
1.	The view should be created with SchemaBinding option
2.	If an Aggregate function in the SELECT LIST, references an expression, and if there is a
	posssibility for that expression to become NULL, then, a replacement value should be
	specified.
3.	If GROUP BY is specified, the view select list must contain a COUNT_BIG(*)expression
4.	The base tables in the view, should be referenced with 2 part name. exmpl dbo.tblProduct
*/