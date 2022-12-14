USE [master]
GO
/****** Object:  Database [urunDb]    Script Date: 1.08.2022 01:21:50 ******/
CREATE DATABASE [urunDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'urunDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\urunDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'urunDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\urunDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [urunDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [urunDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [urunDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [urunDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [urunDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [urunDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [urunDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [urunDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [urunDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [urunDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [urunDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [urunDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [urunDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [urunDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [urunDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [urunDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [urunDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [urunDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [urunDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [urunDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [urunDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [urunDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [urunDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [urunDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [urunDb] SET RECOVERY FULL 
GO
ALTER DATABASE [urunDb] SET  MULTI_USER 
GO
ALTER DATABASE [urunDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [urunDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [urunDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [urunDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [urunDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [urunDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'urunDb', N'ON'
GO
ALTER DATABASE [urunDb] SET QUERY_STORE = OFF
GO
USE [urunDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1.08.2022 01:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerProducts]    Script Date: 1.08.2022 01:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CUserId] [int] NOT NULL,
	[CDate] [datetime2](7) NOT NULL,
	[MUserId] [int] NULL,
	[MDate] [datetime2](7) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_CustomerProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1.08.2022 01:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Address] [nvarchar](1000) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CUserId] [int] NOT NULL,
	[CDate] [datetime2](7) NOT NULL,
	[MUserId] [int] NULL,
	[MDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1.08.2022 01:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CUserId] [int] NOT NULL,
	[CDate] [datetime2](7) NOT NULL,
	[MUserId] [int] NULL,
	[MDate] [datetime2](7) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220729190139_init', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220729202808_init2', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220731205953_init3', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220731214111_init4', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220731215349_init5', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220731215429_init6', N'5.0.11')
GO
SET IDENTITY_INSERT [dbo].[CustomerProducts] ON 

INSERT [dbo].[CustomerProducts] ([Id], [CustomerId], [ProductId], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Quantity]) VALUES (1, 1, 1, 0, 1, CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[CustomerProducts] ([Id], [CustomerId], [ProductId], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Quantity]) VALUES (2, 2, 6, 0, 1, CAST(N'2022-07-31T23:14:25.0057144' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[CustomerProducts] ([Id], [CustomerId], [ProductId], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Quantity]) VALUES (3, 2, 1, 0, 1, CAST(N'2022-07-31T23:43:12.7698698' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[CustomerProducts] ([Id], [CustomerId], [ProductId], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Quantity]) VALUES (7, 1, 3, 0, 1, CAST(N'2022-08-01T00:35:24.4125390' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[CustomerProducts] ([Id], [CustomerId], [ProductId], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Quantity]) VALUES (8, 2, 7, 0, 1, CAST(N'2022-08-01T00:36:59.6835534' AS DateTime2), NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[CustomerProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [CustomerName], [PhoneNumber], [Address], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate]) VALUES (1, N'Ömer Serfice', N'05348318128', N'Pınarbaşı Mahallesi 5.Sok No:26/4', 0, 0, CAST(N'2022-07-29T23:29:46.5041576' AS DateTime2), NULL, NULL)
INSERT [dbo].[Customers] ([Id], [CustomerName], [PhoneNumber], [Address], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate]) VALUES (2, N'Halil Can', N'05443221155', N'Ahievran Mahallesi Kutupevler 347.Sok No:45/7', 0, 0, CAST(N'2022-07-29T23:57:24.2486592' AS DateTime2), NULL, NULL)
INSERT [dbo].[Customers] ([Id], [CustomerName], [PhoneNumber], [Address], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate]) VALUES (3, N'Kemal tan', N'05432114356', N'adress', 1, 0, CAST(N'2022-07-31T19:28:15.1769620' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Quantity], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Status]) VALUES (1, N'Samsung A30', CAST(6500.00 AS Decimal(18, 2)), 100, 0, 1, CAST(N'2022-07-29T00:00:00.0000000' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Quantity], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Status]) VALUES (2, N'Lenovo Yoga 7 Slim Pro', CAST(18000.00 AS Decimal(18, 2)), 30, 1, 0, CAST(N'2022-07-31T20:55:58.7486240' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Quantity], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Status]) VALUES (3, N'Lenovo Yoga 7 Slim Pro', CAST(18000.00 AS Decimal(18, 2)), 49, 0, 0, CAST(N'2022-07-31T21:25:52.5232106' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Quantity], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Status]) VALUES (4, N'Huawei Watch', CAST(3400.00 AS Decimal(18, 2)), 100, 0, 0, CAST(N'2022-07-31T21:26:14.2991140' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Quantity], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Status]) VALUES (5, N'Xiaomi Mi Robot Mop Pro Süpürge ve Paspas Siyah', CAST(4799.00 AS Decimal(18, 2)), 40, 0, 0, CAST(N'2022-07-31T21:27:21.6196525' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Quantity], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Status]) VALUES (6, N'Samsung UE55AU7200, 55 inç, Ultra HD 4K, Smart TV, Siyah', CAST(10368.00 AS Decimal(18, 2)), 75, 0, 0, CAST(N'2022-07-31T21:28:00.1007708' AS DateTime2), NULL, NULL, 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Price], [Quantity], [IsDeleted], [CUserId], [CDate], [MUserId], [MDate], [Status]) VALUES (7, N'x', CAST(1111.00 AS Decimal(18, 2)), 28, 0, 1, CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_CustomerProducts_CustomerId]    Script Date: 1.08.2022 01:21:51 ******/
CREATE NONCLUSTERED INDEX [IX_CustomerProducts_CustomerId] ON [dbo].[CustomerProducts]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerProducts_ProductId]    Script Date: 1.08.2022 01:21:51 ******/
CREATE NONCLUSTERED INDEX [IX_CustomerProducts_ProductId] ON [dbo].[CustomerProducts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerProducts] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Status]
GO
ALTER TABLE [dbo].[CustomerProducts]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProducts_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerProducts] CHECK CONSTRAINT [FK_CustomerProducts_Customers_CustomerId]
GO
ALTER TABLE [dbo].[CustomerProducts]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProducts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerProducts] CHECK CONSTRAINT [FK_CustomerProducts_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [urunDb] SET  READ_WRITE 
GO
