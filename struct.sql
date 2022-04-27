
-- ----------------------------
-- Table structure for Categories
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type IN ('U'))
	DROP TABLE [dbo].[Categories]
GO

CREATE TABLE [dbo].[Categories] (
  [Id] uniqueidentifier  NOT NULL,
  [Name] nvarchar(64) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Categories] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Categories
-- ----------------------------
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (N'6132DC48-0ED3-4C18-B947-BA2E203504CA', N'Категория 1')
GO

INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (N'F4B644D6-CDCF-4DBB-8365-677554768D93', N'Категория 2')
GO

INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (N'2F355C93-8BBE-4E42-970D-ED6C9D18010C', N'Категория 3')
GO

INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (N'254D6768-A01A-4A9F-83D8-A6BEEA84E0EC', N'Категория 4')
GO


-- ----------------------------
-- Table structure for Products
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type IN ('U'))
	DROP TABLE [dbo].[Products]
GO

CREATE TABLE [dbo].[Products] (
  [Id] uniqueidentifier  NOT NULL,
  [Name] nvarchar(64) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Products] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Products
-- ----------------------------
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (N'A457C677-C8EF-4905-8DCF-ED89C694B60D', N'Продукт 1')
GO

INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (N'9F2C26AA-57D9-4819-8DD1-FE5B1CD0D6BD', N'Продукт 2')
GO

INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (N'B0CD1AC5-C968-407F-9A2F-76527A98D938', N'Продукт 3')
GO


-- ----------------------------
-- Table structure for ProductCategory
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory]') AND type IN ('U'))
	DROP TABLE [dbo].[ProductCategory]
GO

CREATE TABLE [dbo].[ProductCategory] (
  [ProductId] uniqueidentifier  NOT NULL,
  [CategoryId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[ProductCategory] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ProductCategory
-- ----------------------------
INSERT INTO [dbo].[ProductCategory] ([ProductId], [CategoryId]) VALUES (N'A457C677-C8EF-4905-8DCF-ED89C694B60D', N'F4B644D6-CDCF-4DBB-8365-677554768D93')
GO

INSERT INTO [dbo].[ProductCategory] ([ProductId], [CategoryId]) VALUES (N'A457C677-C8EF-4905-8DCF-ED89C694B60D', N'6132DC48-0ED3-4C18-B947-BA2E203504CA')
GO

INSERT INTO [dbo].[ProductCategory] ([ProductId], [CategoryId]) VALUES (N'9F2C26AA-57D9-4819-8DD1-FE5B1CD0D6BD', N'F4B644D6-CDCF-4DBB-8365-677554768D93')
GO

INSERT INTO [dbo].[ProductCategory] ([ProductId], [CategoryId]) VALUES (N'9F2C26AA-57D9-4819-8DD1-FE5B1CD0D6BD', N'2F355C93-8BBE-4E42-970D-ED6C9D18010C')
GO


-- ----------------------------
-- Indexes structure for table Categories
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name]
ON [dbo].[Categories] (
  [Name] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Categories
-- ----------------------------
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Products
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_Name]
ON [dbo].[Products] (
  [Name] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Products
-- ----------------------------
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ProductCategory
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_ProductCategory_ProductId]
ON [dbo].[ProductCategory] (
  [ProductId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table ProductCategory
-- ----------------------------
ALTER TABLE [dbo].[ProductCategory] ADD CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED ([CategoryId], [ProductId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table ProductCategory
-- ----------------------------
ALTER TABLE [dbo].[ProductCategory] ADD CONSTRAINT [FK_ProductCategory_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[ProductCategory] ADD CONSTRAINT [FK_ProductCategory_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

