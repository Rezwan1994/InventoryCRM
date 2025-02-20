USE [master]
GO
/****** Object:  Database [SFMSDB]    Script Date: 2/12/2019 9:46:22 PM ******/
CREATE DATABASE [SFMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SFMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SFMSDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SFMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SFMSDB_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SFMSDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SFMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SFMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SFMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SFMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SFMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SFMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SFMSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SFMSDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SFMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SFMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SFMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SFMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SFMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SFMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SFMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SFMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SFMSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SFMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SFMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SFMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SFMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SFMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SFMSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SFMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SFMSDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SFMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [SFMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SFMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SFMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SFMSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [SFMSDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/12/2019 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 2/12/2019 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [uniqueidentifier] NOT NULL,
	[RegId] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[YearOfMfg] [datetime] NOT NULL,
	[CC] [nvarchar](max) NULL,
	[Make] [nvarchar](max) NULL,
	[Financier] [nvarchar](max) NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[FuelSystem] [nvarchar](max) NULL,
	[ChassisNo] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[SubType] [nvarchar](max) NULL,
	[Capacity] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Concerns]    Script Date: 2/12/2019 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concerns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConcernId] [uniqueidentifier] NOT NULL,
	[ConcernName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[WebSite] [nvarchar](max) NULL,
	[ConcernType] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[ConcernLogo] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Concerns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Documents]    Script Date: 2/12/2019 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [uniqueidentifier] NOT NULL,
	[DocumentsType] [nvarchar](max) NULL,
	[FileSource] [nvarchar](max) NULL,
	[IssueDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NOT NULL,
	[UploadedDate] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 2/12/2019 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[ImgSrc] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[DriverLicense] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Drivers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmailHistories]    Script Date: 2/12/2019 9:46:23 PM ******/
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
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 2/12/2019 9:46:23 PM ******/
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
/****** Object:  Table [dbo].[FuelBills]    Script Date: 2/12/2019 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelBills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FuelId] [uniqueidentifier] NOT NULL,
	[CarId] [uniqueidentifier] NOT NULL,
	[DriverId] [uniqueidentifier] NOT NULL,
	[FuelSystem] [nvarchar](max) NULL,
	[Milage] [float] NOT NULL,
	[FuelAmount] [float] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[IssueDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.FuelBills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LookUps]    Script Date: 2/12/2019 9:46:23 PM ******/
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
/****** Object:  Table [dbo].[UserCarMaps]    Script Date: 2/12/2019 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCarMaps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CarId] [uniqueidentifier] NOT NULL,
	[Note] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UserCarMaps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDriverMaps]    Script Date: 2/12/2019 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDriverMaps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [uniqueidentifier] NOT NULL,
	[CarId] [uniqueidentifier] NOT NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserDriverMaps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 2/12/2019 9:46:23 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2/12/2019 9:46:23 PM ******/
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
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [CarId], [RegId], [Model], [YearOfMfg], [CC], [Make], [Financier], [CompanyId], [FuelSystem], [ChassisNo], [Type], [SubType], [Capacity], [Note], [CreatedDate]) VALUES (1, N'76b61308-ba33-40d7-b904-67a4780358a8', N'Dhaka Metro BHA 11-1729', N'Crown Royal Saloon Hybrid', CAST(0x0000A9F100000000 AS DateTime), N'2500888', N'Mercedes-Benz', N'IFIL', N'00000000-0000-0000-0000-000000000000', N'Octen', NULL, N'-1', N'-1', N'-1', NULL, CAST(0x0000A9F10131DCA0 AS DateTime))
INSERT [dbo].[Cars] ([Id], [CarId], [RegId], [Model], [YearOfMfg], [CC], [Make], [Financier], [CompanyId], [FuelSystem], [ChassisNo], [Type], [SubType], [Capacity], [Note], [CreatedDate]) VALUES (2, N'590c3cfc-2480-4284-897e-59dab27585cc', N'Dhaka Metro GA 20-2002', N'740 Le', CAST(0x0000A9F1014CEE6C AS DateTime), N'2700', N'Toyota', N'IFIL', N'00000000-0000-0000-0000-000000000000', N'Gas', NULL, N'Commercial', N'Coveredvan', N'Ton', NULL, CAST(0x0000A9F1014CEE6C AS DateTime))
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([Id], [DocumentId], [DocumentsType], [FileSource], [IssueDate], [ExpireDate], [UploadedDate], [UserId]) VALUES (2, N'1a23c2d6-7832-414f-a691-5a98d6f8156a', N'Driving License', N'Files/Driver/Documents/02-11-19/DrivingLicense/1167049673Huawei-Y5-Prime-2018-Bangladesh.jpg', CAST(0x0000A85B00000000 AS DateTime), CAST(0x0000AA2100000000 AS DateTime), CAST(0x0000A9F10132D3EB AS DateTime), N'2132379a-0a1c-4728-8905-e250d6c7222f')
INSERT [dbo].[Documents] ([Id], [DocumentId], [DocumentsType], [FileSource], [IssueDate], [ExpireDate], [UploadedDate], [UserId]) VALUES (3, N'c83ac6d2-0a1d-46ec-a95e-1f0f84bd0d8b', N'Driving License', N'Files/Driver/Documents/02-11-19/DrivingLicense/1167049673Huawei-Y5-Prime-2018-Bangladesh.jpg', CAST(0x0000A85B00000000 AS DateTime), CAST(0x0000AA2100000000 AS DateTime), CAST(0x0000A9F101334428 AS DateTime), N'8f382513-98e8-4bc5-96b4-3955eecb51f2')
INSERT [dbo].[Documents] ([Id], [DocumentId], [DocumentsType], [FileSource], [IssueDate], [ExpireDate], [UploadedDate], [UserId]) VALUES (4, N'8fb40526-adc5-42f2-9ddc-dd2e6a7f90f9', N'Driving License', N'Files/Driver/Documents/02-11-19/DrivingLicense/1508415250125377.jpg', CAST(0x0000A9C800000000 AS DateTime), CAST(0x0000A9E600000000 AS DateTime), CAST(0x0000A9F1013C40EA AS DateTime), N'5694f3ea-ead1-41f7-af51-fef96024c19f')
SET IDENTITY_INSERT [dbo].[Documents] OFF
SET IDENTITY_INSERT [dbo].[Drivers] ON 

INSERT [dbo].[Drivers] ([Id], [DriverId], [Name], [MobileNumber], [Email], [ImgSrc], [Address], [DriverLicense], [CreatedDate], [IsActive]) VALUES (8, N'5694f3ea-ead1-41f7-af51-fef96024c19f', N'Abul Kasem', N'+88 01723 573565', NULL, N'', N'Dhaka', N'412423', CAST(0x0000A9F1013C1BCF AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Drivers] OFF
SET IDENTITY_INSERT [dbo].[FuelBills] ON 

INSERT [dbo].[FuelBills] ([Id], [FuelId], [CarId], [DriverId], [FuelSystem], [Milage], [FuelAmount], [UnitPrice], [IssueDate]) VALUES (1, N'0ca03b8a-6647-4f5c-99a6-428ca7537d37', N'76b61308-ba33-40d7-b904-67a4780358a8', N'359de89e-e6f2-4f3a-ac60-7eca59059a1c', N'Gas', 100, 10, 0, CAST(0x0000A9F100000000 AS DateTime))
INSERT [dbo].[FuelBills] ([Id], [FuelId], [CarId], [DriverId], [FuelSystem], [Milage], [FuelAmount], [UnitPrice], [IssueDate]) VALUES (2, N'cf019671-8e56-47f8-82ce-36671b5ca48e', N'590c3cfc-2480-4284-897e-59dab27585cc', N'00000000-0000-0000-0000-000000000000', N'Octen', 80, 500, 0, CAST(0x0000A9F100000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[FuelBills] OFF
SET IDENTITY_INSERT [dbo].[LookUps] ON 

INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (1, NULL, N'VehicleType', N'Select One ', N'-1', 0, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (2, NULL, N'VehicleType', N'Private', N'Private', 1, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (3, NULL, N'VehicleType', N'Commercial', N'Commercial', 2, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (4, NULL, N'VehicleType', N'Motorbike', N'Motorbike', 3, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (5, NULL, N'VehicleType', N'Pick Up Van', N'Pick Up Van', 4, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (6, NULL, N'VehicleType', N'Frezzer Van', N'FrezzerVan', 5, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (7, NULL, N'VehicleType', N'Pay Van', N'Payvan', 6, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (8, N'VehicleType', N'VehicleSubType', N'Select One', N'-1', 0, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (9, N'VehicleType', N'VehicleSubType', N'Covered Van', N'Coveredvan', 1, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (10, N'VehicletType', N'VehicleSubType', N'Carton Type', N'Carton Type', 2, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (11, N'VehicleType', N'VehicleSubType', N'Hanger Type', N'HangerType', 3, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (12, NULL, N'Capacity', N'Select One', N'-1', 0, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (13, NULL, N'Capacity', N'Ton', N'Ton', 1, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (14, NULL, N'Capacity', N'Bag', N'Bag', 2, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (15, NULL, N'Capacity', N'CBM', N'CBM', 3, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (16, NULL, N'FuelSystem', N'Select One', N'-1', 0, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (17, NULL, N'FuelSystem', N'Gas', N'Gas', 1, 1, NULL, NULL)
INSERT [dbo].[LookUps] ([Id], [ParentDataKey], [DataKey], [DisplayText], [DataValue], [DataOrder], [IsActive], [AlterDisplayText], [AlterDisplayText1]) VALUES (18, NULL, N'FuelSystem', N'Octen', N'Octen', 2, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LookUps] OFF
SET IDENTITY_INSERT [dbo].[UserDriverMaps] ON 

INSERT [dbo].[UserDriverMaps] ([Id], [DriverId], [CarId], [Note]) VALUES (9, N'5694f3ea-ead1-41f7-af51-fef96024c19f', N'76b61308-ba33-40d7-b904-67a4780358a8', N'uiuy')
SET IDENTITY_INSERT [dbo].[UserDriverMaps] OFF
USE [master]
GO
ALTER DATABASE [SFMSDB] SET  READ_WRITE 
GO
