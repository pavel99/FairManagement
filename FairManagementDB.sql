USE [master]
GO
/****** Object:  Database [FairManagementSystemDB]    Script Date: 5/27/2015 12:59:14 PM ******/
CREATE DATABASE [FairManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FairManagementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\FairManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FairManagementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\FairManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FairManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FairManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FairManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FairManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FairManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FairManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FairManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FairManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FairManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [FairManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FairManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FairManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FairManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FairManagementSystemDB]
GO
/****** Object:  Table [dbo].[tbl_Visitor]    Script Date: 5/27/2015 12:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Visitor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Visitor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_VisitorZone]    Script Date: 5/27/2015 12:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VisitorZone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZID] [int] NOT NULL,
	[VID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_VisitorZone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_ZoneType]    Script Date: 5/27/2015 12:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ZoneType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_ZoneType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Visitor] ON 

INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (1, N'PavelFahmi', N'pfa@gmail.com', N'38462')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (2, N'erferf', N'erfe@gamil.com', N'345345')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (3, N'Mahmud', N'm@gmail.com', N'123445')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (4, N'Pavel', N'p@gmail.com', N'12345')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (5, N'hytbghytb', N'vfgtrev6', N'242434')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (6, N'Mizan', N'm@gmail.com', N'12345678')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (7, N'Nahid', N'N@gmail.com', N'1345678')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (8, N'Nahid', N'@gmail.com', N'1456789')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (9, N'4tgf5r', N'tg5t5', N'454556')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (10, N'Mizanur Rahman', N'mizan@gmail.com', N'01728149408')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (11, N'Mizanur Rahman', N'mizan@gmail.com', N'01728149408')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (12, N'Mizanur Rahman', N'mizan@gmail.com', N'01728149408')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (13, N'Jannat', N'j@mail.com', N'45665')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (14, N'Anika', N'A@mail.com', N'45665')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (15, N'Nahid', N'23@gmail.com', N'01612123456')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (16, N'Arif Hasnat', N'Arif@gmail.com', N'01750539739')
INSERT [dbo].[tbl_Visitor] ([ID], [Name], [Email], [ContactNumber]) VALUES (17, N'Nabil', N'54@yahoo.com', N'01654872345')
SET IDENTITY_INSERT [dbo].[tbl_Visitor] OFF
SET IDENTITY_INSERT [dbo].[tbl_VisitorZone] ON 

INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (1, 1, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (2, 3, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (3, 4, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (4, 1, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (5, 3, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (6, 4, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (7, 5, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (8, 6, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (9, 7, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (10, 1, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (11, 1, 1)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (12, 1, 9)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (13, 3, 9)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (14, 4, 9)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (15, 5, 9)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (16, 6, 9)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (17, 7, 9)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (18, 1, 10)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (19, 3, 10)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (20, 4, 10)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (21, 5, 10)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (22, 6, 10)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (23, 7, 10)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (24, 1, 11)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (25, 3, 11)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (26, 4, 11)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (27, 5, 11)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (28, 6, 11)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (29, 7, 11)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (30, 1, 12)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (31, 3, 12)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (32, 4, 12)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (33, 5, 12)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (34, 6, 12)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (35, 7, 12)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (36, 1, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (37, 3, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (38, 4, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (39, 5, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (40, 6, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (41, 7, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (42, 1, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (43, 3, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (44, 4, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (45, 5, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (46, 6, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (47, 7, 13)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (48, 1, 14)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (49, 3, 14)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (50, 4, 14)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (51, 5, 14)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (52, 6, 14)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (53, 7, 14)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (55, 1, 15)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (56, 4, 15)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (57, 6, 15)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (58, 1, 16)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (59, 3, 16)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (60, 4, 16)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (61, 7, 16)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (62, 1, 17)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (63, 3, 17)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (64, 4, 17)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (65, 6, 17)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (66, 7, 17)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (67, 1, 17)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (68, 3, 17)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (69, 4, 17)
INSERT [dbo].[tbl_VisitorZone] ([ID], [ZID], [VID]) VALUES (70, 6, 17)
SET IDENTITY_INSERT [dbo].[tbl_VisitorZone] OFF
SET IDENTITY_INSERT [dbo].[tbl_ZoneType] ON 

INSERT [dbo].[tbl_ZoneType] ([ID], [ZoneType]) VALUES (1, N'Mobile Apps Zone')
INSERT [dbo].[tbl_ZoneType] ([ID], [ZoneType]) VALUES (3, N'Software Telecom ')
INSERT [dbo].[tbl_ZoneType] ([ID], [ZoneType]) VALUES (4, N'Game & Multimedia Zone')
INSERT [dbo].[tbl_ZoneType] ([ID], [ZoneType]) VALUES (5, N'Digital bangladesh Zone')
INSERT [dbo].[tbl_ZoneType] ([ID], [ZoneType]) VALUES (6, N'Enterprise Application Zone')
INSERT [dbo].[tbl_ZoneType] ([ID], [ZoneType]) VALUES (7, N'Artificial Intelligence Zone')
SET IDENTITY_INSERT [dbo].[tbl_ZoneType] OFF
ALTER TABLE [dbo].[tbl_VisitorZone]  WITH CHECK ADD  CONSTRAINT [FK_tbl_VisitorZone_PK_tbl_Visitor] FOREIGN KEY([VID])
REFERENCES [dbo].[tbl_Visitor] ([ID])
GO
ALTER TABLE [dbo].[tbl_VisitorZone] CHECK CONSTRAINT [FK_tbl_VisitorZone_PK_tbl_Visitor]
GO
ALTER TABLE [dbo].[tbl_VisitorZone]  WITH CHECK ADD  CONSTRAINT [FK_tbl_VisitorZone_PK_tbl_ZoneType] FOREIGN KEY([ZID])
REFERENCES [dbo].[tbl_ZoneType] ([ID])
GO
ALTER TABLE [dbo].[tbl_VisitorZone] CHECK CONSTRAINT [FK_tbl_VisitorZone_PK_tbl_ZoneType]
GO
USE [master]
GO
ALTER DATABASE [FairManagementSystemDB] SET  READ_WRITE 
GO
