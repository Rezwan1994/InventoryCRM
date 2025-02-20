USE [master]
GO
/****** Object:  Database [SFMSDB]    Script Date: 1/28/2019 8:31:04 PM ******/
CREATE DATABASE [SFMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SFMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SFMSDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SFMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SFMSDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [SFMSDB] SET AUTO_CLOSE ON 
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
ALTER DATABASE [SFMSDB] SET  ENABLE_BROKER 
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
ALTER DATABASE [SFMSDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SFMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SFMSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SFMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [SFMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SFMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SFMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SFMSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SFMSDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/28/2019 8:31:04 PM ******/
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
/****** Object:  Table [dbo].[Cars]    Script Date: 1/28/2019 8:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [uniqueidentifier] NOT NULL,
	[RegId] [nvarchar](max) NULL,
	[LicenseNo] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[YearOfMfg] [datetime] NOT NULL,
	[CC] [nvarchar](max) NULL,
	[Make] [nvarchar](max) NULL,
	[Financier] [nvarchar](max) NULL,
	[LigalOwner] [nvarchar](max) NULL,
	[Allocation] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[DriverId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[FuelSystem] [nvarchar](max) NULL,
	[ChassisNo] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Concerns]    Script Date: 1/28/2019 8:31:04 PM ******/
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
/****** Object:  Table [dbo].[Documents]    Script Date: 1/28/2019 8:31:04 PM ******/
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
	[UploadedBy] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 1/28/2019 8:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [uniqueidentifier] NOT NULL,
	[CarId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[ImgSrc] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Drivers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmailHistories]    Script Date: 1/28/2019 8:31:04 PM ******/
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
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 1/28/2019 8:31:04 PM ******/
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
/****** Object:  Table [dbo].[FuelBills]    Script Date: 1/28/2019 8:31:04 PM ******/
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
/****** Object:  Table [dbo].[LookUps]    Script Date: 1/28/2019 8:31:04 PM ******/
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
/****** Object:  Table [dbo].[UserCarMaps]    Script Date: 1/28/2019 8:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCarMaps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CarId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UserCarMaps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDriverMaps]    Script Date: 1/28/2019 8:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDriverMaps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [uniqueidentifier] NOT NULL,
	[CarId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UserDriverMaps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 1/28/2019 8:31:04 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1/28/2019 8:31:04 PM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201901281345506_InitialCreate', N'SFMS.Repository.DataContext', 0x1F8B0800000000000400ED5D4973E3B815BEA72AFF41A55352D563D9EE4BD225CF942DB727AE782BAB7BA6921B444232D224A1E1D263FDB61CF293F217065CB1520208909655AABEB41F88EF617B0B96A7F7FFFFFE6FFAD36B188CBEC3384138BA189F9D9C8E4730F2B08FA2D5C5384B973FFC6DFCD38F7FFED3F4B31FBE8E7EA9BFFB987F476A46C9C5F8254DD79F2693C47B8121484E42E4C538C1CBF4C4C3E104F878727E7AFAF7C9D9D904128831C11A8DA6CF5994A210167F903F6738F2E03ACD40708F7D1824159D94CC0BD4D1030861B2061EBC18CF6FEEE727CF708D1394E278331E5D06089066CC61B01C8F4014E114A4A4919FBE26709EC6385ACDD78400822F9B3524DF2D4190C0AAF19FE8E7BAFD383DCFFB31A1156B282F4B521C1A029E7DAC06662256EF34BCE366E0C8D07D26439C6EF25E17C377319E81783C12F97C9A0571FE4D35B065A513F2E9871143F8D04C3D5921F9BF0FA35916A4590C2F2298A531083E8C9EB24580BC7FC2CD17FC0D46175116046C7B488B48194720A4A718AF619C6E9EE1B26AE5AD3F1E4DF87A13B162538DA95376E2364A3F9E8F470F84395804B0996EA6C373B26CE0CF30823148A1FF04D214C6518E018BAE4ADC055E646828BB9F33E42BB86D4778862B8A40962811B5F1E81EBCDEC16895BE5C8CC97FC7A31BF40AFD9A52C17E8D10914C52298DB39D5CEE9007A3043EE0DE391532DB3B977F41103F2EEF97AB9AD33599BE2F4489188FFF6CD6FF90806FB077263728029187603CC05A5A81E0F1F7680056974180BD4A03F6CC8A18085B51BE8ED1776B90190ED720DA58A2DC6430986F921486BD0FDCEC0524094A06502DB318E64A3A177543B19F4EA8FDDB6E1573DF238E126DD3587D7FB48F6DABB9181F6B992850F23F7A5F644F2F38EA9FCBA5EFC730497AE74380214CFB97CC6229F4DE1746F07BE3F26FB49E918F7BE7F32B5CCCD100FDA96427E7D23BAF073C5C87EEF0CAB5C5D1B612D7D8CB42A200B5CD4453E16827D4BCEA01B2F5C0EA711E64B9DFA000CE71167BFDB3BA4D920C76707C64A4CFAF6B14BB81FABA0E30F03B3964ED60579BBE7CBBD23DD797D9F2F3A3C4B6889A93CD8EF5F1C9203EE13D5E10517FC8C2C5007BDECF2140FD1FA0DC86AB79EC1D8C9FDB7D6BA8D2B5975E4A16770D7485710041E44A0D15F3FB0F9494E7D57ABA88AD7354482D42BAA909BDAFB62F305C07A491A4FBFDF3C2C3288499370C9F2B6F204637310E87E334881D2ABA33CF16FF815EFF7BFA82D915F63764C39512111CA8778493232D5E9E7F5E66299E33CDD7D3E62ABC67087C5B941C638633DA9C36BDB8E3081E24E9D7B5DFF769683123B5B233B25575A5A3B152F37273CA3FA41D1A44C15DC3C48BD17A900B9FA3613D1A56AA96D7C166983E0D65BE87B4DC39AFFC306C8063B02E5BB3ADF6F3AA7FD53990B5CEEF7CAF10B1979A86BAFEFE68A35BB40F199F373FDF7272CC36E06B807B1480155DE2982C1573DF3D6FEF65C8BAC91D8148D3D3A71879B60DEA7AFCAE2DBB77187FFBBAD695DCF2EBA3DCAA793D81B8DC448221FCE2C1F8A084F8FA9B2FF0B57F7B9EF7E91710640338FC84D363ECD363F56EFB61577EC1654096DA90232D323C7BAB2BEDFCF91BB156F7405B09D11A4745A4E6E5E049A1A9036134DFA56F6138E54DA5E3ACAB79BDC9C5A8D1BCDFE1158A4CE6BCA8709CEFDEA43C8718EE0261A83BD9C37A49F90492E4771CF71FAAE1CA97B94DAE6100C98AB605AAEED6E94149378D26DFD0BBD66BDA4F7B8A8F8FFAAC377D36E0A39CE3739C7D5496FBFE1C273F1807884808B30D2D0ECBF32D9FA4438844546A24A9BACF37B8C49CC3943A6FE311655F46A39E14D4C98E9A4DF8895CBD29DA81C13C4E964098B25D28F5634919A32ED981C0BF739260F8621D2C7A11AD06A3E53BD0E841B904448B7660D4077612425DB0A33EBBDF9630D8420D1C661FA78462CA35D0AADD8112A92AD34051AD9C8AAE12D346209BB2E9A48CF6AE08D3494B58F894F46B4DB41813265E5146F332467CF6C3DC3C7E3A2C31265EA208A36E5ADB7022AB18ACA0509ACBB30F6F509C14A7910B902BA9991F4A9FB1EAA765686B4E54C3889E061DEEFADBFCFFD5A5231F267FA2A84FC7ED867425571245AF60D30225D7A2DEDC030188152ECB0C075918B5B93DDB6A57FB5F16A022E9635491D52C4645D2C760E2A6591C86AC8F554546B33815491F83897B667118B2C118CF84019E19F5A6086AE63A5350F4119888651686219BCC138D49E6278AD2F5D1D8B063168DA5EBA3D50E358B54D3F451E8B1128B43A906F34EDF1E71D34FC90673C8DC2C7293C8D00D5A464389B99651B20116EB8272686C818C379D086A50D4B31349D10A9B395167EB69F4DABDB352EB2D203ABABDB56A4F0A9E0606F38BB0211B6395BB4E055A59A08F571D5CB14815C94085D43B2D4E7FD4447D9C3A809785A969062354ECFBB9A1519C046C6F87244815491FA309AD65511AA23E4E133ACBE23444E37593CB9372DD9405FA7865F82B0B54528C5B54C6B62A5A5416EC8DD2A2DB491BADD58AA2A1B6B6D4ED476FB181AA9C2166E8E66889BC06852213B78A46A5F27E15A5EBA3312F5FB841A3647D2C36F4940563E9066E15177DCA39575C8939E2D5468D77A5D4986F257BD5318C95E4A93174E4AEAD664F52E7CEF975B0B1941D0D530F830F28E577846C89816C95C7D49C5895240359AF0EA1B979AA68C37B3E5D1DF8764D569F23F38AACA6EE8D647327A336E2BD0D4843C6B757EF47D0D9204E4E2C18BA3E1A171FC3C2710506785821660DD160697B0A9C86A88F43433E58204A35701A684C07E73350B21996AC2229D550A9350113926E6B4A0C11B9D00809952B356D6B13BD2837B629325159620C23AFBAC45213E4329A91C72B692627AC4D34237FCADA900D4EF0C42009EE184F2CDC2F65DDDC3C596BEB36245D75DD5EBFAF631C776789AEB5B5BD9BC68523729E275B70B41FFB6A3FD8B03E5E4151BAC11198CA1075B041ADE6A7A3E5A1D177225849EDD345D6D0E6E26E5A283A780BD13C29B0310E6D201A76A1BD6A3F26A10E9B13AF8386DFA7BB3B35707BCD55C7C8711B9C8A66D6A63A484E6C534D3738FBA29172DCD11725F77B66F846C259BDD6B1114D35848660B655EC472C85A838EE728B2F321030155A171C36E28AC3620BCCDA55C5AF892DABC8665855849A885591DFC2BECA816AFC3B05B1B43BF2D976E8B33D1266E6D99C8D40B7C36808F5B6CAFD08B69BE72526F6F60DA7973E65B49DE15624CD49DE52FF90EE40DE70AECBC7A6B6F3AC44D19CE396BAFB2CC734944CC4E974F8AABCCCE14BDEE7BB1A1ACEC57B4235F52D8C3A13B1C5433564E3DB3371F3CD900FF6295DF9CCDC566F74B9156FA9B7CFFAC2FE90B48EC3926FB18FF7D7077C7F2D456E889F34DC2B4AF37713B951454DECCEF2278551949F8C476488BE233F0FA1284F614EF20F4EE6BF05B30015A7A8F507F720424B98A465E8E6F8FCF4EC5CC815B83F79FB2649E273A775EAE47DFC540D107A8AF201DD195C6AF3430759847ECB202AB0964504804D32BDE83B88BD1710FF2504AF7F65A13A25CCB342E392E259214989EFF223EFD42EF19D5DD798E476564052023BCBF91393D459C1C989E8ACE0F8186BEB652FFEE48835A0F4F3B4D688F24FD0590DA09474CE0E4D0E57D6142BF3C47207A2B6C5BC6E0E969C94E3CD6A4EB95F1FB1937D3E68DE0A8BCFC766B76811CD7460D92666DD5B2109B9D3ACB084FC68764325E740B3C263F39CB968189BCBCC00AF43BEB2C3D03E72B6307B13AACA1C66E9CF88D9C1ACE0A49F20EDECF8C919C03A43A932805983D11F1A726D8495510BEF570A9C7B7D4EF762CE2CB92AFB961520F7933E7642C9FD6CCFDE7819DDFD5995DEE17F7E6781D25E32611D864CCA49A8AC265291E0C30E0FBB5BFB425E0B2B2C3177859DE115F35358A3395365AA044EF6808A540F0E5A09F9444C160A449D8869B7225161B14998BA204809980A35E026FD926B7765CB8BFE77AB20DD9F2CB9D691CE845D91CCE8A8BCDFB1F2969304D91DBB383403AE2D8098D0C772E76AEA416ED5B8576EC47C201DAE7E7DFF6ED5379F1367CF769CCE37C48E2F2DF8DC38CB000373419053E374C39132E37483E97A2A659A18E730A4479999C6CEC7708925E73DB16E1B9745C61A8DCB14D3C57177618ADA72C458DE2FB7E481E9E33AA0ED8DFABB952BC7D7E93656A9630296C39887BD3A91EE9012E53066C1B13488C949EC8F965C1E75EFE735BF982CE4CDF74F5232902E205222107BF9962F2AFA94F243B9F9732CE18E6FEA8E7774EFFD8E4E4C8F21FF8C3DDF9CE6993835DB6D0930CA97DBA4AF8BFCC54BD93E52B03B9D84566A0C25BAE3C4192A1E4EF36A2819F4917443C588F902414D7EFA89395A39D69FECE6A895BC43C5A72EDDCD62676E0F157C59B61B5C3BF1878A092DD763649019A48D5DF3891E478DEC216D9C8A623D2E5BB28BB4A1774F3C2287A94C27CF59946BEAF2AF6B98A015859812CC087AF9BD0F05ADBFB98D96B8D6DEA44F6C8BEA4F44A30A53402C03B88C8979075E4A8A3D62848AC44DC5F14A2E420BE8DF468F59BACED2CB2481E122E022FCA693EDFC8BEC2A7C9BA78FC5CD55E2A20BA49928376E8FD1558602BF69F78DC230B540E426A8F2A048ABE669EE49AD360DD2831446DA06540DDF355CC32877991ACDF318CD416E42CDDB4696D71D5C012F7FFB51441BB583EC9E087ED8A7D708AC6210261506AD4FFE246BD80F5F7FFC0308F8FF81B9A50000, N'6.2.0-61023')
USE [master]
GO
ALTER DATABASE [SFMSDB] SET  READ_WRITE 
GO
