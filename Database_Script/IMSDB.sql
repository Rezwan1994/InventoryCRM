USE [master]
GO
/****** Object:  Database [IMSDB]    Script Date: 9/15/2019 10:52:45 PM ******/
CREATE DATABASE [IMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\IMSDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\IMSDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IMSDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMSDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [IMSDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [IMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMSDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMSDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [IMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [IMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [IMSDB]
GO
/****** Object:  Table [dbo].[EmailHistories]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LookUps]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentReceives]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductWarehouseMaps]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOrderDetails]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOrders]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WareHouses]    Script Date: 9/15/2019 10:52:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [IMSDB] SET  READ_WRITE 
GO
