USE [master]
GO
/****** Object:  Database [LeaveManagementAssignment]    Script Date: 11/06/2025 12:06:23 SA ******/
CREATE DATABASE [LeaveManagementAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LeaveManagementAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LeaveManagementAssignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LeaveManagementAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LeaveManagementAssignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LeaveManagementAssignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LeaveManagementAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LeaveManagementAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LeaveManagementAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LeaveManagementAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LeaveManagementAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LeaveManagementAssignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET RECOVERY FULL 
GO
ALTER DATABASE [LeaveManagementAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [LeaveManagementAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LeaveManagementAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LeaveManagementAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LeaveManagementAssignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LeaveManagementAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LeaveManagementAssignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LeaveManagementAssignment', N'ON'
GO
ALTER DATABASE [LeaveManagementAssignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [LeaveManagementAssignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LeaveManagementAssignment]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/06/2025 12:06:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/06/2025 12:06:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](30) NOT NULL,
	[Department] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [Name]) VALUES (10, N'HR')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (14, N'NEW')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Role], [Department]) VALUES (1022, N'123', N'vinhn172005@gmail.com', N'123', N'Admin', 10)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
USE [master]
GO
ALTER DATABASE [LeaveManagementAssignment] SET  READ_WRITE 
GO
