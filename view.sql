-- ----------------------------
-- View structure for AllProductsWithCategories
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AllProductsWithCategories]') AND type IN ('V'))
	DROP VIEW [dbo].[AllProductsWithCategories]
GO

CREATE VIEW [dbo].[AllProductsWithCategories] AS SELECT
	Products.Id AS [Product Id], 
	Products.Name AS [Product Name], 
	Categories.Name AS Category
FROM
	dbo.Products
	LEFT JOIN
	dbo.ProductCategory
	ON 
		Products.Id = ProductCategory.ProductId
	LEFT JOIN
	dbo.Categories
	ON 
		ProductCategory.CategoryId = Categories.Id
GO