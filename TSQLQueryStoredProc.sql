
CREATE PROCEDURE dbo.advGetProductCategory @ProductName nvarchar(30) = NULL, @SubCatName nvarchar(30) = NULL
AS 

SELECT a1.Name AS 'Category Name', a2.Name AS 'Subcategory Name', a4.Name AS 'Product Model Name' FROM Production.ProductCategory a1
	INNER JOIN Production.ProductSubcategory a2 ON a2.ProductCategoryID = a1.ProductCategoryID
	INNER JOIN Production.Product a3 ON a3.ProductSubcategoryID = a2.ProductSubcategoryID
	INNER JOIN Production.ProductModel a4 ON a4.ProductModelID = a3.ProductModelID
	WHERE a1.Name = @ProductName AND a2.Name = @SubCatName
;
GO
