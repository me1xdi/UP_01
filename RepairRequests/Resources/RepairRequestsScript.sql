USE [master]
GO
/****** Object:  Database [RepairRequests]    Script Date: 15.12.2024 13:55:34 ******/
CREATE DATABASE [RepairRequests]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RepairRequests', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLSERVER04\MSSQL\DATA\RepairRequests.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RepairRequests_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLSERVER04\MSSQL\DATA\RepairRequests_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RepairRequests] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepairRequests].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepairRequests] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RepairRequests] SET ARITHABORT OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RepairRequests] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RepairRequests] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RepairRequests] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RepairRequests] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RepairRequests] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RepairRequests] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RepairRequests] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RepairRequests] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RepairRequests] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RepairRequests] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RepairRequests] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RepairRequests] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RepairRequests] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RepairRequests] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RepairRequests] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RepairRequests] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RepairRequests] SET  MULTI_USER 
GO
ALTER DATABASE [RepairRequests] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RepairRequests] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RepairRequests] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RepairRequests] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RepairRequests]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [nvarchar](100) NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[email] [nvarchar](70) NULL,
 CONSTRAINT [PK__Clients__3213E83FF61B151B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestId] [int] NULL,
	[employeeId] [int] NULL,
	[dateOfCreation] [datetime] NULL,
	[comment] [nchar](255) NULL,
	[idDetail] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [nvarchar](100) NOT NULL,
	[roleId] [int] NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[email] [nvarchar](70) NULL,
 CONSTRAINT [PK__Employee__3213E83FA3355959] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[serialNumber] [nvarchar](20) NULL,
 CONSTRAINT [PK__Equipmen__3213E83F647D5656] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateOfCreation] [datetime] NULL,
	[clientId] [int] NULL,
	[equipmentId] [int] NULL,
	[typeOfFaultId] [int] NULL,
	[problemDescription] [nvarchar](255) NULL,
	[employeeId] [int] NULL,
	[statusId] [int] NULL,
	[dateOfDone] [date] NULL,
 CONSTRAINT [PK__Requests__3213E83F096B599F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](40) NULL,
 CONSTRAINT [PK__Role__3213E83F6FDCF882] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](20) NULL,
 CONSTRAINT [PK__Status__3213E83F99174534] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfFault]    Script Date: 15.12.2024 13:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfFault](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
 CONSTRAINT [PK__TypeOfFa__3213E83F9262C96D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (1, N'Мещерякова Аделина Артёмовна', N'+78957567676', N'gfhjk@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (2, N'Медведев Александр Максимович', N'+78676565656', N'sdfghj@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (3, N'Соловьева Анастасия Марковна', N'+79875676565', N'gjhk@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (4, N'Васильев Святослав Петрович', N'+79675677686', N'dfghjk@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (5, N'Иванова София Данииловна', N'+79876576575', N'dhsjafhk@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (6, N'tgsrstgw', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (7, N'ndxfgdzsEAW', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (8, N'gartrtgh', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (9, N'jyhtgrsef', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (10, N'jhfgfdqqqqqq', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (11, N'рпавы', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (12, N'гг', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (13, N'hjg', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (14, N'jjj', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (15, N'gfds', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (16, N'yutrew', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (17, N'dwdqswd', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (18, N'yutrew', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (19, N'yutrew', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (20, N'yutrew', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (21, N'yutrew', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (22, N'yutrew', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (23, N'yjhtbdgbhtdhdyh', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (24, N'yjhtbdgbhtdhdyh', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (25, N'dvd', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (26, N'hjjhhh', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (27, N'dvd', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (28, N'kjhkhk', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (29, N'dvd', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (30, N'lol', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (31, N'nn', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (32, N'mjmmm', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (33, N'kkk', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (34, N'пп', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (35, N'в', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (36, N'й', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (37, N'ь', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (38, N'l', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (39, N'ттш', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (40, N'ттш', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (41, N'лл', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (42, N'ff', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (43, N'Медведев Александр Максимович', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (44, N'r', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (45, N'dbgb', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (46, N'65t', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (47, N'k', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (48, N'hhh', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (49, N'bnmnkj', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (50, N'bnmnkj', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (51, N'bnmnkj', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (52, N'fghj', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (53, N'Мещерякова Аделина Артёмовна', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (54, N'Васильев Святослав Петрович', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (55, N'Васильев Святослав Петрович', NULL, NULL)
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (56, N'Соловьева Анастасия Марковна', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (1, 1, 1, CAST(N'2024-04-15T13:09:00.000' AS DateTime), N'Обнаружена плюс одна царапина                                                                                                                                                                                                                                  ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (2, 4, 1, CAST(N'2024-05-15T13:09:00.000' AS DateTime), N'Отсутствуют детали для сборки                                                                                                                                                                                                                                  ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (3, 5, 3, CAST(N'2024-06-15T13:09:00.000' AS DateTime), N'Исправно работает                                                                                                                                                                                                                                              ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (4, 6, 2, CAST(N'2024-07-15T13:09:00.000' AS DateTime), N'Начал работать 3 секунды после включения                                                                                                                                                                                                                       ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (5, 7, 4, CAST(N'2024-08-15T13:09:00.000' AS DateTime), N'Найдена лишняя деталь                                                                                                                                                                                                                                          ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (6, 1, 1, CAST(N'2024-12-14T20:00:29.277' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 3)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (7, 1, 5, CAST(N'2024-12-14T20:11:42.667' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (8, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (9, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (10, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (11, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (12, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (13, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (14, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (15, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (16, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (17, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (18, 7, 1, CAST(N'2024-12-15T13:04:13.857' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (19, 7, 2, CAST(N'2024-12-15T13:04:32.397' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 2)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (20, 7, 2, CAST(N'2024-12-15T13:04:32.397' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 2)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (21, 7, 2, CAST(N'2024-12-15T13:04:32.397' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 2)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (22, 7, 2, CAST(N'2024-12-15T13:04:32.397' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 2)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (23, 7, 2, CAST(N'2024-12-15T13:04:32.397' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 2)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (24, 7, 2, CAST(N'2024-12-15T13:04:32.397' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 1)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (25, 7, 2, CAST(N'2024-12-15T13:04:32.397' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 1)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (26, 7, 2, CAST(N'2024-12-15T13:04:32.397' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 1)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (27, 7, NULL, CAST(N'2024-12-15T13:04:59.287' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (28, 7, 1, CAST(N'2024-12-15T13:04:59.287' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (29, 7, 1, CAST(N'2024-12-15T13:04:59.287' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (30, 7, 1, CAST(N'2024-12-15T13:04:59.287' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (31, 6, 5, CAST(N'2024-12-15T13:48:50.127' AS DateTime), N'Добавление детали                                                                                                                                                                                                                                              ', 3)
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment], [idDetail]) VALUES (32, 6, 1, CAST(N'2024-12-15T13:48:57.987' AS DateTime), N'Привлечение к работе специалиста                                                                                                                                                                                                                               ', NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Detail] ON 

INSERT [dbo].[Detail] ([id], [description]) VALUES (1, N'Нагревательный элемент для чайника')
INSERT [dbo].[Detail] ([id], [description]) VALUES (2, N'Сливной насос для стиральной машины')
INSERT [dbo].[Detail] ([id], [description]) VALUES (3, N'Фильтр для пылесоса')
INSERT [dbo].[Detail] ([id], [description]) VALUES (4, N'Ремень привода для стиральной машины')
INSERT [dbo].[Detail] ([id], [description]) VALUES (5, N'Термостат для холодильника')
INSERT [dbo].[Detail] ([id], [description]) VALUES (6, N'Датчик уровня воды для посудомоечной машины')
INSERT [dbo].[Detail] ([id], [description]) VALUES (7, N'Кнопка включения для микроволновки')
INSERT [dbo].[Detail] ([id], [description]) VALUES (8, N'Лопасть вентилятора для кухонной вытяжки')
INSERT [dbo].[Detail] ([id], [description]) VALUES (9, N'Мотор компрессора для холодильника')
INSERT [dbo].[Detail] ([id], [description]) VALUES (10, N'Уплотнительная резинка для духового шкафа')
SET IDENTITY_INSERT [dbo].[Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (1, N'Анохин Андрей Романович', 1, N'+79563456789', N'qwer@gmail.com')
INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (2, N'Крылова Есения Романовна', 2, N'+79675434343', N'rewq@gmail.com')
INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (3, N'Князева Элина Викторовна', 3, N'+79674565432', N'uyti@gmail.com')
INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (4, N'Кузнецов Александр Кириллович', 4, N'+79223124567', N'sjdh@gmail.com')
INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (5, N'Климов Давид Артёмович', 5, N'+79456545454', N'ghjj@gmail.com')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (1, N'Кофемашинка', N'fg56-89')
INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (2, N'Мясорубка', N'127856CB')
INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (3, N'Соковыжималка', N'VB7898')
INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (4, N'Аэрогриль', N'678999')
INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (5, N'Тостер', N'UN8976I')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId], [dateOfDone]) VALUES (1, CAST(N'2024-04-14T13:09:00.000' AS DateTime), 5, 1, 1, N'Царапина на боковой панели', 1, 1, NULL)
INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId], [dateOfDone]) VALUES (4, CAST(N'2024-12-14T18:23:26.587' AS DateTime), 55, 2, 2, N'Вмятина', 1, 2, NULL)
INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId], [dateOfDone]) VALUES (5, CAST(N'2024-12-14T19:02:45.087' AS DateTime), 56, 3, 5, N'Прекращает работу через 5 секунд после начала работы', 5, 3, CAST(N'2024-12-14' AS Date))
INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId], [dateOfDone]) VALUES (6, CAST(N'2024-12-08T15:41:00.300' AS DateTime), 43, 4, 4, N'При включении не начинает работу', 5, 3, CAST(N'2024-12-11' AS Date))
INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId], [dateOfDone]) VALUES (7, CAST(N'2024-12-12T11:21:32.157' AS DateTime), 53, 5, 3, N'Не отключается автоматически', 2, 3, CAST(N'2024-12-19' AS Date))
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [title]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([id], [title]) VALUES (2, N'Руководитель')
INSERT [dbo].[Role] ([id], [title]) VALUES (3, N'Заместитель генерального директора')
INSERT [dbo].[Role] ([id], [title]) VALUES (4, N'Генеральный директор')
INSERT [dbo].[Role] ([id], [title]) VALUES (5, N'Системный администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [title]) VALUES (1, N'В ожидании')
INSERT [dbo].[Status] ([id], [title]) VALUES (2, N'В работе')
INSERT [dbo].[Status] ([id], [title]) VALUES (3, N'Выполнено')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfFault] ON 

INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (1, N'Дефект')
INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (2, N'Повреждение')
INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (3, N'Нарушение функционирования')
INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (4, N'Отказ')
INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (5, N'Сбой')
SET IDENTITY_INSERT [dbo].[TypeOfFault] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Detail] FOREIGN KEY([idDetail])
REFERENCES [dbo].[Detail] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Detail]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Employee] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Employee]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Requests] FOREIGN KEY([requestId])
REFERENCES [dbo].[Requests] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Requests]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__roleId__20C1E124] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__roleId__20C1E124]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__client__1BFD2C07] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__client__1BFD2C07]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__employ__1ED998B2] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__employ__1ED998B2]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__equipm__1CF15040] FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__equipm__1CF15040]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__status__1FCDBCEB] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__status__1FCDBCEB]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__typeOf__1DE57479] FOREIGN KEY([typeOfFaultId])
REFERENCES [dbo].[TypeOfFault] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__typeOf__1DE57479]
GO
USE [master]
GO
ALTER DATABASE [RepairRequests] SET  READ_WRITE 
GO
