USE [master]
GO
/****** Object:  Database [imsdb]    Script Date: 6/29/2020 11:48:10 AM ******/
CREATE DATABASE [imsdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'imsdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\imsdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'imsdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\imsdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [imsdb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [imsdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [imsdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [imsdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [imsdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [imsdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [imsdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [imsdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [imsdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [imsdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [imsdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [imsdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [imsdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [imsdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [imsdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [imsdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [imsdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [imsdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [imsdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [imsdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [imsdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [imsdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [imsdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [imsdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [imsdb] SET RECOVERY FULL 
GO
ALTER DATABASE [imsdb] SET  MULTI_USER 
GO
ALTER DATABASE [imsdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [imsdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [imsdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [imsdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [imsdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [imsdb] SET QUERY_STORE = OFF
GO
USE [imsdb]
GO
/****** Object:  Schema [gamersxonedb]    Script Date: 6/29/2020 11:48:10 AM ******/
CREATE SCHEMA [gamersxonedb]
GO
/****** Object:  Schema [rezwan]    Script Date: 6/29/2020 11:48:10 AM ******/
CREATE SCHEMA [rezwan]
GO
/****** Object:  Table [dbo].[EmailHistories]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MyProperty] [nvarchar](max) NULL,
	[TemplateKey] [nvarchar](max) NULL,
	[ToEmail] [nvarchar](max) NULL,
	[CcEmail] [nvarchar](max) NULL,
	[BccEmail] [nvarchar](max) NULL,
	[FromEmail] [nvarchar](max) NULL,
	[FromName] [nvarchar](max) NULL,
	[EmailSubject] [nvarchar](max) NULL,
	[EmailBodyContent] [nvarchar](max) NULL,
	[EmailSentDate] [datetime] NOT NULL,
	[IsSystemAutoSent] [bit] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[ReadCount] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.EmailHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[TemplateKey] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ToEmail] [nvarchar](max) NULL,
	[CcEmail] [nvarchar](max) NULL,
	[BccEmail] [nvarchar](max) NULL,
	[FromEmail] [nvarchar](max) NULL,
	[FromName] [nvarchar](max) NULL,
	[ReplyEmail] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[BodyContent] [nvarchar](max) NULL,
	[BodyFile] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdatedBy] [nvarchar](max) NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.EmailTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LookUps]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookUps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentDataKey] [nvarchar](max) NULL,
	[DataKey] [nvarchar](max) NULL,
	[DisplayText] [nvarchar](max) NULL,
	[DataValue] [nvarchar](max) NULL,
	[DataOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AlterDisplayText] [nvarchar](max) NULL,
	[AlterDisplayText1] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.LookUps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentReceives]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentReceives](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId] [uniqueidentifier] NOT NULL,
	[SalesOrderId] [uniqueidentifier] NOT NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[PaymentAmount] [float] NOT NULL,
	[BalanceDue] [float] NOT NULL,
 CONSTRAINT [PK_dbo.PaymentReceives] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[BuyingPrice] [float] NOT NULL,
	[SaleingPrice] [float] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[BuyingPrice] [float] NOT NULL,
	[SellingPrice] [float] NOT NULL,
	[Category] [nvarchar](max) NULL,
	[SubCategory] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductWarehouseMaps]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductWarehouseMaps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductWarehouseMapId] [uniqueidentifier] NOT NULL,
	[WarehouseId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ProductWarehouseMaps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
 CONSTRAINT [PK_dbo.PurchaseOrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [uniqueidentifier] NOT NULL,
	[VendorId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Freight] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_dbo.PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderDetails]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderDetailId] [uniqueidentifier] NOT NULL,
	[SalesOrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[WarehouseId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_dbo.SalesOrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrders]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderId] [uniqueidentifier] NOT NULL,
	[WarehouseId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Freight] [float] NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[TaxAmount] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[OrderDate] [datetime] NULL,
	[DelivaryDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.SalesOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[ImgSrc] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[UserType] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WareHouses]    Script Date: 6/29/2020 11:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseId] [uniqueidentifier] NOT NULL,
	[WarehouseName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.WareHouses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 10) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LookUps] ON 

INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (1, NULL, N'CustomerType', N'Select One', N'-1', 0, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (2, NULL, N'CustomerType', N'Customer', N'Customer', 1, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (3, NULL, N'CustomerType', N'Vendor', N'Vendor', 2, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (4, NULL, N'ProductCategory', N'Select One', N'-1', 0, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (5, NULL, N'ProductCategory', N'Seeds', N'Seeds', 1, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (6, NULL, N'ProductCategory', N'Medicine', N'Medicine', 2, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LookUps] OFF
SET IDENTITY_INSERT [dbo].[PaymentReceives] ON 

INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (15, N'371094de-db96-4d56-90a5-419d4b71578e', N'8daa2fb1-8902-42cf-b5f1-a5076b31f02e', N'Partially Paid', NULL, CAST(N'2019-09-25T22:29:30.053' AS DateTime), NULL, 5000, 1895)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (16, N'535deeda-0ccc-4d38-a7cc-e9fab7f0781f', N'77441030-cb4d-4bcd-a23c-3632d64770a4', N'Paid', NULL, CAST(N'2019-09-22T16:47:32.390' AS DateTime), NULL, 2950, 0)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (17, N'3364d6c1-734f-4bd8-b855-35b2a2a71373', N'd60d3018-7bc2-4422-8492-d7d0268a6317', N'Paid', NULL, CAST(N'2019-11-16T00:00:00.000' AS DateTime), NULL, 230, 0)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (18, N'8ede95ac-e450-4c31-8f31-2510ffd4436e', N'40f705a3-4cbc-4136-9eb2-809fb4e2a719', N'Paid', NULL, CAST(N'2020-05-29T01:20:57.500' AS DateTime), NULL, 6399.4, 0)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (19, N'1be692ec-2be0-4178-a55d-62ff72650b82', N'8d4ab3f9-3200-46cc-859d-ee1d6e9d4377', N'Paid', NULL, CAST(N'2020-05-29T22:37:31.320' AS DateTime), NULL, 2729, 0)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (20, N'4b75782d-9fff-4fa5-bca1-065b9aa53469', N'9796b1a9-60e6-45bb-a901-f229d85dc241', N'Partially Paid', NULL, CAST(N'2020-05-30T09:50:03.240' AS DateTime), NULL, 300, 33)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (21, N'75a999a7-76f2-4724-9927-f16129288e0b', N'6ee9dd97-9014-47f0-aa8b-9be0bd1ffb52', N'UnPaid', NULL, CAST(N'2020-05-30T00:00:00.000' AS DateTime), NULL, 0, 7580)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (22, N'fdfc53d1-44e2-45e6-857f-49a9a2aa715a', N'22e905f6-745e-4955-804d-4790cce0359a', N'UnPaid', N'nothing to say', CAST(N'2020-05-30T00:00:00.000' AS DateTime), NULL, 0, 200)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (23, N'2f58c6f9-1693-4fee-89ca-e4228f5bf4e3', N'd0f13231-d4b2-4ad0-bb51-d82caa394430', N'Paid', NULL, CAST(N'2020-06-06T00:00:00.000' AS DateTime), NULL, 142.5, 0)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (24, N'06d68431-ecf9-4c61-8487-1547dda67f16', N'a0631fe0-cf56-47ba-a40b-3155bf757307', N'Paid', NULL, CAST(N'2020-06-06T00:00:00.000' AS DateTime), NULL, 147, 0)
INSERT [dbo].[PaymentReceives] ([Id], [PaymentId], [SalesOrderId], [PaymentStatus], [Note], [PaymentDate], [PaymentType], [PaymentAmount], [BalanceDue]) VALUES (25, N'03d8aadc-8bbb-4961-b9de-b1ee5ed6fea9', N'505e0e45-b27a-4dfa-bf27-e9723635c674', N'Partially Paid', NULL, CAST(N'2020-06-26T00:00:00.000' AS DateTime), NULL, 80, 20)
SET IDENTITY_INSERT [dbo].[PaymentReceives] OFF
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([Id], [ProductId], [BuyingPrice], [SaleingPrice], [Quantity]) VALUES (1, N'efa19bee-66a2-40cb-b065-078334bdfdb5', 22, 44, 4)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductId], [ProductName], [BuyingPrice], [SellingPrice], [Category], [SubCategory], [Quantity], [ImageUrl]) VALUES (11, N'3608b0fd-fd20-4b1d-b692-595d755a2ff7', N'Medicine 1', 40, 50, N'Medicine', NULL, 7, N'/Files/Products/Documents/05-30-20/1063579314Pic1.jpg')
INSERT [dbo].[Products] ([Id], [ProductId], [ProductName], [BuyingPrice], [SellingPrice], [Category], [SubCategory], [Quantity], [ImageUrl]) VALUES (12, N'056a8140-80c1-4886-8e5f-b839dc22cce1', N'Medicine 2', 30, 40, N'Medicine', NULL, 8, N'/Files/Products/Documents/05-30-20/706985121Pic2.jpg')
INSERT [dbo].[Products] ([Id], [ProductId], [ProductName], [BuyingPrice], [SellingPrice], [Category], [SubCategory], [Quantity], [ImageUrl]) VALUES (13, N'01f778e2-bad8-4651-bf12-09c552bc1e8a', N'Rice Seeds', 20, 30, N'-1', NULL, 20, N'/Files/Products/Documents/05-30-20/2075979155pic4.jpg')
INSERT [dbo].[Products] ([Id], [ProductId], [ProductName], [BuyingPrice], [SellingPrice], [Category], [SubCategory], [Quantity], [ImageUrl]) VALUES (14, N'c377d53a-1b20-4e1d-ad88-90ea79e82922', N'Medicine 3', 50, 60, N'Medicine', NULL, 10, N'/Files/Products/Documents/05-30-20/1468915478Pic3.png')
INSERT [dbo].[Products] ([Id], [ProductId], [ProductName], [BuyingPrice], [SellingPrice], [Category], [SubCategory], [Quantity], [ImageUrl]) VALUES (15, N'7fa719a8-092b-48e7-a9d5-da3e92e55ccb', N'Madicine 3', 44, 55, N'Medicine', NULL, 10, N'/Files/Products/Documents/06-06-20/151199917LOGO.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductWarehouseMaps] ON 

INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (7, N'56297bf1-596b-4b16-8318-f3efb5651cea', N'203ced7c-1322-425b-816d-b143f06170b0', N'd65fb4a1-0d8a-42d2-a194-e45a3b079c06', 25)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (8, N'19c2bff1-f9a2-478d-bd4f-952985297e0a', N'2ab6f9a2-86ba-4592-89bf-f119feee8a38', N'c39ba110-bdf8-48e2-bfb9-f515a63a282f', -10)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (9, N'ece9d735-d5bd-48a9-8faa-3f4fb0771efa', N'203ced7c-1322-425b-816d-b143f06170b0', N'c39ba110-bdf8-48e2-bfb9-f515a63a282f', 5)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (10, N'3a4925ee-0cf1-49a3-9560-f1bfeee1b13a', N'2ab6f9a2-86ba-4592-89bf-f119feee8a38', N'd65fb4a1-0d8a-42d2-a194-e45a3b079c06', 20)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (11, N'da64f3b8-42d4-4fd7-853b-38ecaa51b939', N'203ced7c-1322-425b-816d-b143f06170b0', N'b7c6c08e-6985-4347-a451-1ae416d91831', 10)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (12, N'65853638-a300-4e87-ab05-908772a49b18', N'203ced7c-1322-425b-816d-b143f06170b0', N'efa19bee-66a2-40cb-b065-078334bdfdb5', 39)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (13, N'b5c2e4f6-6d35-446a-b300-d8c5e7bc0c10', N'2ab6f9a2-86ba-4592-89bf-f119feee8a38', N'88d2fa8e-a03b-4d39-870e-6e69ee9f5c66', 21)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (14, N'a3b3f731-7793-477e-9077-b02fe94bae11', N'2ab6f9a2-86ba-4592-89bf-f119feee8a38', N'efa19bee-66a2-40cb-b065-078334bdfdb5', 9)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (15, N'5768e614-0892-427d-80f2-a7c1f35817bd', N'2ab6f9a2-86ba-4592-89bf-f119feee8a38', N'32b5ed20-fa1e-429d-9fe5-3eebaa7615de', 46)
INSERT [dbo].[ProductWarehouseMaps] ([Id], [ProductWarehouseMapId], [WarehouseId], [ProductId], [Quantity]) VALUES (17, N'4755e4ea-b660-486b-912f-3f8606cd2532', N'38943088-b458-4dae-81a0-a6f7af0eccd8', N'88d2fa8e-a03b-4d39-870e-6e69ee9f5c66', 30)
SET IDENTITY_INSERT [dbo].[ProductWarehouseMaps] OFF
SET IDENTITY_INSERT [dbo].[SalesOrderDetails] ON 

INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (52, N'152e2a4a-09de-47b3-9318-ce50d7a30f0b', N'77441030-cb4d-4bcd-a23c-3632d64770a4', N'd65fb4a1-0d8a-42d2-a194-e45a3b079c06', 15, 200, 0, 0, 3000, N'203ced7c-1322-425b-816d-b143f06170b0')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (55, N'7280e09c-695f-4cfe-9cad-f6d3c80fd0e5', N'8daa2fb1-8902-42cf-b5f1-a5076b31f02e', N'efa19bee-66a2-40cb-b065-078334bdfdb5', 35, 80, 0, 0, 2800, N'203ced7c-1322-425b-816d-b143f06170b0')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (56, N'5af5025c-e1c9-43e3-b83b-a7b47639d740', N'8daa2fb1-8902-42cf-b5f1-a5076b31f02e', N'88d2fa8e-a03b-4d39-870e-6e69ee9f5c66', 25, 150, 0, 0, 3750, N'2ab6f9a2-86ba-4592-89bf-f119feee8a38')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (65, N'fbe9a264-9dc9-4c02-af53-a2e11f75441c', N'd60d3018-7bc2-4422-8492-d7d0268a6317', N'efa19bee-66a2-40cb-b065-078334bdfdb5', 1, 80, 0, 0, 80, N'203ced7c-1322-425b-816d-b143f06170b0')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (66, N'1ef39d2e-da10-49a2-b251-9b378bb4f20c', N'd60d3018-7bc2-4422-8492-d7d0268a6317', N'88d2fa8e-a03b-4d39-870e-6e69ee9f5c66', 1, 150, 0, 0, 150, N'2ab6f9a2-86ba-4592-89bf-f119feee8a38')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (73, N'3b6ca2fe-e672-4ebc-9382-67b7703291e5', N'40f705a3-4cbc-4136-9eb2-809fb4e2a719', N'efa19bee-66a2-40cb-b065-078334bdfdb5', 1, 80, 0, 0, 80, N'2ab6f9a2-86ba-4592-89bf-f119feee8a38')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (74, N'62f4ad35-2367-4757-9ccd-81fab379edeb', N'40f705a3-4cbc-4136-9eb2-809fb4e2a719', N'32b5ed20-fa1e-429d-9fe5-3eebaa7615de', 4, 1500, 0, 0, 6000, N'2ab6f9a2-86ba-4592-89bf-f119feee8a38')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (75, N'4de178d7-8ebb-4fa5-90d6-9250b126b159', N'40f705a3-4cbc-4136-9eb2-809fb4e2a719', N'88d2fa8e-a03b-4d39-870e-6e69ee9f5c66', 3, 150, 0, 0, 450, N'2ab6f9a2-86ba-4592-89bf-f119feee8a38')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (76, N'ec86ab06-c47f-489d-adbc-1a0a10f104c0', N'8d4ab3f9-3200-46cc-859d-ee1d6e9d4377', N'efa19bee-66a2-40cb-b065-078334bdfdb5', 1, 80, 0, 0, 80, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (77, N'a185a008-c1e2-43ce-a3b2-627183610764', N'8d4ab3f9-3200-46cc-859d-ee1d6e9d4377', N'32b5ed20-fa1e-429d-9fe5-3eebaa7615de', 1, 1500, 0, 0, 1500, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (78, N'798b6a8d-b697-4499-bab9-dac0e5baca95', N'8d4ab3f9-3200-46cc-859d-ee1d6e9d4377', N'88d2fa8e-a03b-4d39-870e-6e69ee9f5c66', 1, 150, 0, 0, 150, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (79, N'1c1e28c5-acfb-414f-9783-94bc37ea24b6', N'8d4ab3f9-3200-46cc-859d-ee1d6e9d4377', N'eb30219b-2ff6-4519-b2da-bae5dd5beee2', 3, 333, 0, 0, 999, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (81, N'9274ec43-26b6-4916-9efb-fb0434c6fe50', N'9796b1a9-60e6-45bb-a901-f229d85dc241', N'eb30219b-2ff6-4519-b2da-bae5dd5beee2', 1, 333, 0, 0, 333, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (82, N'3da7e79b-19ac-4a92-b67e-859d7fd25309', N'6ee9dd97-9014-47f0-aa8b-9be0bd1ffb52', N'88d2fa8e-a03b-4d39-870e-6e69ee9f5c66', 40, 150, 0, 0, 6000, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (83, N'eda56eaa-b44b-403c-9b7f-aa6c1a6abd94', N'6ee9dd97-9014-47f0-aa8b-9be0bd1ffb52', N'efa19bee-66a2-40cb-b065-078334bdfdb5', 1, 80, 0, 0, 80, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (84, N'8dfdc8cf-87d7-42a4-9d61-a9545d064a01', N'6ee9dd97-9014-47f0-aa8b-9be0bd1ffb52', N'32b5ed20-fa1e-429d-9fe5-3eebaa7615de', 1, 1500, 0, 0, 1500, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (87, N'fc92d989-a434-416c-9285-990deb02ccd2', N'22e905f6-745e-4955-804d-4790cce0359a', N'efa19bee-66a2-40cb-b065-078334bdfdb5', 1, 80, 0, 0, 80, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (88, N'3c1f561e-cfaa-4cf2-aa15-3849611dde72', N'22e905f6-745e-4955-804d-4790cce0359a', N'ae49d55b-c1d0-47ce-99a9-6edb1934c240', 1, 120, 0, 0, 120, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (90, N'52c40576-9dfb-4f64-95bf-24b60288c4bc', N'd0f13231-d4b2-4ad0-bb51-d82caa394430', N'3608b0fd-fd20-4b1d-b692-595d755a2ff7', 3, 50, 0, 0, 150, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (92, N'1b6f4eae-dd30-4c4e-be51-21420b58d04e', N'a0631fe0-cf56-47ba-a40b-3155bf757307', N'01f778e2-bad8-4651-bf12-09c552bc1e8a', 5, 30, 0, 0, 150, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[SalesOrderDetails] ([Id], [SalesOrderDetailId], [SalesOrderId], [ProductId], [Quantity], [Price], [Amount], [SubTotal], [Total], [WarehouseId]) VALUES (94, N'7e3f4ffc-f5cc-4fd1-afe1-e222a32fcb8d', N'505e0e45-b27a-4dfa-bf27-e9723635c674', N'056a8140-80c1-4886-8e5f-b839dc22cce1', 2, 40, 0, 0, 80, N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[SalesOrderDetails] OFF
SET IDENTITY_INSERT [dbo].[SalesOrders] ON 

INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (22, N'8daa2fb1-8902-42cf-b5f1-a5076b31f02e', N'2070a003-1375-45c3-bce4-7c382f48ea61', N'b7b086ca-bb36-461c-abd3-117fd18ff99a', NULL, 6895, 1895, 1000, 10, 0, 0, CAST(N'2019-09-20T00:00:00.000' AS DateTime), CAST(N'2019-09-20T00:00:00.000' AS DateTime), CAST(N'2019-09-20T21:00:33.670' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (23, N'77441030-cb4d-4bcd-a23c-3632d64770a4', N'fa6f0a8c-776e-49fe-91a2-24d172b5a3c9', N'b7b086ca-bb36-461c-abd3-117fd18ff99a', NULL, 3670, 0, 250, 10, 0, 3800, CAST(N'2019-09-22T00:00:00.000' AS DateTime), CAST(N'2019-09-22T00:00:00.000' AS DateTime), CAST(N'2019-09-22T16:45:47.377' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (24, N'd60d3018-7bc2-4422-8492-d7d0268a6317', N'9f4170cb-4cc1-4c10-b4fb-1db6727014e9', N'441d22d5-01ec-4d4d-a17a-f488c1e14ada', NULL, 230, 0, 0, 0, 0, 230, CAST(N'2019-11-16T00:00:00.000' AS DateTime), CAST(N'2019-11-16T00:00:00.000' AS DateTime), CAST(N'2019-11-16T07:09:30.000' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (25, N'40f705a3-4cbc-4136-9eb2-809fb4e2a719', N'77b4f9e7-58b6-4315-bb88-80059c07bf1e', N'441d22d5-01ec-4d4d-a17a-f488c1e14ada', NULL, 6399.4, 0, 0, 2, 0, 0, CAST(N'2020-05-29T00:00:00.000' AS DateTime), CAST(N'2020-05-29T00:00:00.000' AS DateTime), CAST(N'2020-05-29T01:19:27.673' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (26, N'6d078ecc-b289-46c9-ba4c-ef72fe44d7ae', N'1ab5d8c5-6103-4cf7-b9bf-af6d3590b84a', N'2c29b8d4-07f7-4371-9cf6-11520d21dfaa', NULL, 23423, 0, 0, 0, 0, 23423, CAST(N'2020-05-29T22:29:21.607' AS DateTime), CAST(N'2020-05-29T22:29:21.607' AS DateTime), CAST(N'2020-05-29T22:29:21.607' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (27, N'87ea244d-f809-4ce8-af91-de2d78b1f424', N'b3487d1a-0546-4d31-a69c-ac68771cc014', N'2c29b8d4-07f7-4371-9cf6-11520d21dfaa', NULL, 2063, 0, 0, 0, 0, 2063, CAST(N'2020-05-29T22:30:48.207' AS DateTime), CAST(N'2020-05-29T22:30:48.677' AS DateTime), CAST(N'2020-05-29T22:30:47.317' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (28, N'8d4ab3f9-3200-46cc-859d-ee1d6e9d4377', N'adbd83c5-5b55-4f58-8e35-c6b255169f00', N'2c29b8d4-07f7-4371-9cf6-11520d21dfaa', NULL, 2729, 0, 0, 0, 0, 2729, CAST(N'2020-05-29T22:37:07.467' AS DateTime), CAST(N'2020-05-29T22:37:07.660' AS DateTime), CAST(N'2020-05-29T22:37:07.063' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (29, N'9796b1a9-60e6-45bb-a901-f229d85dc241', N'd68d67f4-4b14-451c-90a1-09a111e7b57f', N'2c29b8d4-07f7-4371-9cf6-11520d21dfaa', NULL, 333, 33, 0, 0, 0, 0, CAST(N'2020-05-29T00:00:00.000' AS DateTime), CAST(N'2020-05-29T00:00:00.000' AS DateTime), CAST(N'2020-05-29T22:39:01.420' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (30, N'6ee9dd97-9014-47f0-aa8b-9be0bd1ffb52', N'61b385bb-cdad-49ad-a1c9-c62758011e34', N'2c29b8d4-07f7-4371-9cf6-11520d21dfaa', NULL, 7580, 7580, 0, 0, 0, 7580, CAST(N'2020-05-30T11:03:27.697' AS DateTime), CAST(N'2020-05-30T11:03:27.697' AS DateTime), CAST(N'2020-05-30T11:03:27.697' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (31, N'22e905f6-745e-4955-804d-4790cce0359a', N'97259b16-4db7-458d-b859-18bb12cfee50', N'7dddd6c4-2481-4da3-aa25-82bfdd25b860', NULL, 200, 200, 0, 0, 0, 0, CAST(N'2020-05-30T00:00:00.000' AS DateTime), CAST(N'2020-05-30T00:00:00.000' AS DateTime), CAST(N'2020-05-30T11:09:30.160' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (32, N'd0f13231-d4b2-4ad0-bb51-d82caa394430', N'10760ab7-05c5-4583-a9a6-e6751aae24d5', N'66f055e0-2620-4f44-9f12-0ec6519b33ab', NULL, 142.5, 0, 0, 5, 0, 0, CAST(N'2020-06-06T00:00:00.000' AS DateTime), CAST(N'2020-06-06T00:00:00.000' AS DateTime), CAST(N'2020-06-06T21:27:19.133' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (33, N'a0631fe0-cf56-47ba-a40b-3155bf757307', N'902d70bd-72c8-4fe7-838b-0fb77dd9d286', N'e8f1b60a-29d0-40d8-bbd9-2e7199c13f35', NULL, 147, 0, 0, 2, 0, 0, CAST(N'2020-06-06T00:00:00.000' AS DateTime), CAST(N'2020-06-06T00:00:00.000' AS DateTime), CAST(N'2020-06-06T22:08:48.490' AS DateTime))
INSERT [dbo].[SalesOrders] ([Id], [SalesOrderId], [WarehouseId], [CustomerId], [Remarks], [Amount], [SubTotal], [Freight], [DiscountAmount], [TaxAmount], [Total], [OrderDate], [DelivaryDate], [CreatedDate]) VALUES (34, N'505e0e45-b27a-4dfa-bf27-e9723635c674', N'2078b159-b748-4b4b-8d46-f2d5501a21d8', N'e8897e9e-91b8-4994-9f40-c16ad550b836', NULL, 100, 20, 20, 0, 0, 0, CAST(N'2020-06-26T00:00:00.000' AS DateTime), CAST(N'2020-06-26T00:00:00.000' AS DateTime), CAST(N'2020-06-26T19:19:40.057' AS DateTime))
SET IDENTITY_INSERT [dbo].[SalesOrders] OFF
SET IDENTITY_INSERT [dbo].[UserLogins] ON 

INSERT [dbo].[UserLogins] ([Id], [UserId], [UserName], [EmailAddress], [Phone], [Address], [Password], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate]) VALUES (1, N'00000000-0000-0000-0000-000000000000', N'Admin', N'rajib@gmail.com', N'0173737333', N'nothing', N'12345', 1, 0, N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[UserLogins] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (1, N'b7b086ca-bb36-461c-abd3-117fd18ff99a', N'Md Arafatul Islam', N'01521433158', N'auiarafat@gmail.com', N'', N'Khilket', N'Customer', CAST(N'2019-08-31T22:32:29.303' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (2, N'91672117-32dc-4e09-be08-fa6e35eb3981', N'Rezwan', N'01521433158', N'rez@g.com', N'', N'Dhaka', N'Vendor', CAST(N'2019-09-21T23:22:11.087' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (3, N'441d22d5-01ec-4d4d-a17a-f488c1e14ada', N'Rezwanul Haque', N'01750425444', N'rezwan.aiub10@gmail.com', N'', N'27 No House, 20 No Road, Nikunjo-2, Khilket', N'Customer', CAST(N'2019-11-16T07:06:56.353' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (4, N'e810960b-8157-4b4a-9279-d53145eb5cc3', N'Al-Emran Nayem', N'01685551990', N'a.imrannayem@gmail.com', N'', N'section-12;Block-D;Road-Avenue;House-10, section-12;Block-D;Road-Avenue;House-10', N'Vendor', CAST(N'2019-11-24T17:16:20.537' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (5, N'7dddd6c4-2481-4da3-aa25-82bfdd25b860', N'Al-Emran Nayem', N'01685551990', N'a.imrannayem@gmail.com', N'', N'section-12;Block-D;Road-Avenue;House-10, section-12;Block-D;Road-Avenue;House-10', N'Customer', CAST(N'2019-12-09T14:15:56.810' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (6, N'9598c3d8-7f5c-498c-a4cc-1bc06e19d62f', N'Al-Emran Nayem', N'01685551990', N'a.imrannayem@gmail.com', N'', N'section-12;Block-D;Road-Avenue;House-10, section-12;Block-D;Road-Avenue;House-10', N'Vendor', CAST(N'2019-12-09T14:16:37.313' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (7, N'2c29b8d4-07f7-4371-9cf6-11520d21dfaa', N'tokon', N'01680051205', N'tokon@gmail.com', N'', N'Jobed vila, Hayat kha, Ulipur, Ulipur, Kurigram', N'Customer', CAST(N'2019-12-15T14:44:24.267' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (8, N'e8897e9e-91b8-4994-9f40-c16ad550b836', N'Dabir Uddin', N'01750425444', N'dabir@gmail.com', N'', N'Kishorganj', N'Customer', CAST(N'2020-05-30T11:27:01.383' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (9, N'1279f9ce-1fa9-4195-90f4-54f93095773c', N'Dristy', N'01750425444', N'dristy@gmail.com', N'', N'Kishorgong', N'Customer', CAST(N'2020-05-30T11:32:10.403' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (10, N'66f055e0-2620-4f44-9f12-0ec6519b33ab', N'sakib', N'32423434', N'sakib@gmail.com', N'', N'dhap rangpur', N'-1', CAST(N'2020-06-06T21:24:04.117' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [UserId], [Name], [Mobile], [Email], [ImgSrc], [Address], [UserType], [CreatedDate], [IsActive]) VALUES (11, N'e8f1b60a-29d0-40d8-bbd9-2e7199c13f35', N'Mrittunjoy', N'324324324', N'm@gmail.com', N'', N'Dhap,Rangpur', N'Customer', CAST(N'2020-06-06T22:06:34.683' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[WareHouses] ON 

INSERT [dbo].[WareHouses] ([Id], [WarehouseId], [WarehouseName], [Address], [Description]) VALUES (6, N'2ab6f9a2-86ba-4592-89bf-f119feee8a38', N'War-02', N'Mirpur-14', NULL)
INSERT [dbo].[WareHouses] ([Id], [WarehouseId], [WarehouseName], [Address], [Description]) VALUES (7, N'c35787a9-42aa-4c61-a8ea-023e7fb22aee', N'Mirpur 12', N'section-12;Block-D;Road-Avenue;House-10, section-12;Block-D;Road-Avenue;House-10', N'Nayem''s Shop')
INSERT [dbo].[WareHouses] ([Id], [WarehouseId], [WarehouseName], [Address], [Description]) VALUES (8, N'd30b56b3-2bc8-42a6-ab47-27eface2b70c', N'abc', N'section-12;Block-D;Road-Avenue;House-10, section-12;Block-D;Road-Avenue;House-10', N'good')
INSERT [dbo].[WareHouses] ([Id], [WarehouseId], [WarehouseName], [Address], [Description]) VALUES (9, N'38943088-b458-4dae-81a0-a6f7af0eccd8', N'jhangirnagan', N'section-12;Block-D;Road-Avenue;House-10, section-12;Block-D;Road-Avenue;House-10', N'warehouse 5')
SET IDENTITY_INSERT [dbo].[WareHouses] OFF
USE [master]
GO
ALTER DATABASE [imsdb] SET  READ_WRITE 
GO
