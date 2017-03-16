USE [master]
GO
/****** Object:  Database [ManageVisitors]    Script Date: 16/03/2017 3:23:24 PM ******/
CREATE DATABASE [ManageVisitors]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManageVisitors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ManageVisitors.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ManageVisitors_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ManageVisitors_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ManageVisitors] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManageVisitors].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManageVisitors] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManageVisitors] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManageVisitors] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManageVisitors] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManageVisitors] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManageVisitors] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManageVisitors] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManageVisitors] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManageVisitors] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManageVisitors] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManageVisitors] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManageVisitors] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManageVisitors] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManageVisitors] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManageVisitors] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManageVisitors] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManageVisitors] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManageVisitors] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManageVisitors] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManageVisitors] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManageVisitors] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManageVisitors] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManageVisitors] SET RECOVERY FULL 
GO
ALTER DATABASE [ManageVisitors] SET  MULTI_USER 
GO
ALTER DATABASE [ManageVisitors] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManageVisitors] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManageVisitors] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManageVisitors] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ManageVisitors] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ManageVisitors', N'ON'
GO
USE [ManageVisitors]
GO
/****** Object:  Table [dbo].[tbl_DepartmentEmployeeRegistration]    Script Date: 16/03/2017 3:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_DepartmentEmployeeRegistration](
	[EmployeeSrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeTokenNo] [varchar](max) NOT NULL,
	[EmployeeName] [varchar](max) NULL,
	[EmployeeAddress] [varchar](max) NULL,
	[EmployeeContactNo] [varchar](max) NULL,
	[EmployeeEmailID] [varchar](max) NULL,
	[EmployeeDepartmentID] [bigint] NULL,
	[EmployeeDesignationID] [bigint] NULL,
	[EmployeePassword] [varchar](max) NULL,
	[Date] [datetime] NULL CONSTRAINT [DF_tbl_DepartmentEmployeeRegistration_Date]  DEFAULT (getdate()),
 CONSTRAINT [PK_tbl_DepartmentEmployeeRegistration] PRIMARY KEY CLUSTERED 
(
	[EmployeeSrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_DepartmentMaster]    Script Date: 16/03/2017 3:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_DepartmentMaster](
	[DepartmentID] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](max) NOT NULL,
	[DepartmentCreateDate] [datetime] NULL CONSTRAINT [DF_tbl_DepartmentMaster_DepartmentCreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tbl_DepartmentMaster] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_DesignationMaster]    Script Date: 16/03/2017 3:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_DesignationMaster](
	[DesignationID] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [bigint] NOT NULL,
	[DesignationName] [varchar](max) NOT NULL,
	[DesignationCreateDate] [datetime] NULL CONSTRAINT [DF_tbl_DesignationMaster_DesignationCreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tbl_DesignationMaster] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_RequestProcess]    Script Date: 16/03/2017 3:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_RequestProcess](
	[EmployeeId] [bigint] NULL,
	[RequestProcessSrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[VisitorSrNo] [bigint] NULL,
	[EmployeeDepartmentID] [bigint] NULL,
	[VisitStartTime] [datetime] NULL,
	[VisitEndTime] [datetime] NULL,
	[VisitorAccessories] [varchar](max) NULL,
	[NoOfVisitors] [bigint] NULL,
	[VisitorVisitResons] [varchar](max) NULL,
	[RequestProcessDate] [datetime] NULL CONSTRAINT [DF_tbl_RequestProcess_RequestProcessDate]  DEFAULT (getdate()),
	[ActivityOwnerStatus] [varchar](max) NULL,
	[AreaOwnerStatus] [varchar](max) NULL,
	[SafetyStatus] [varchar](max) NULL,
	[ContractorStatus] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_RequestProcess] PRIMARY KEY CLUSTERED 
(
	[RequestProcessSrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_VisitorUserRegistration]    Script Date: 16/03/2017 3:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_VisitorUserRegistration](
	[VisitorSrNo] [bigint] IDENTITY(1,1) NOT NULL,
	[VisitorUserID] [varchar](max) NOT NULL,
	[VisitorName] [varchar](max) NULL,
	[VisitorAddress] [varchar](max) NULL,
	[VisitorContactNo] [varchar](max) NULL,
	[VisitorEmailID] [varchar](max) NULL,
	[VisitorNatureOfWork] [varchar](max) NULL,
	[VisitorContractor] [varchar](max) NULL,
	[VisitorContractorCoNo] [varchar](max) NULL,
	[VisitorPassword] [varchar](max) NULL,
	[VisitorRegistrationDate] [datetime] NULL CONSTRAINT [DF_tbl_VisitorUserRegistration_VisitorRegistrationDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tbl_VisitorUserRegistration] PRIMARY KEY CLUSTERED 
(
	[VisitorSrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ON 

INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (6, N'2133', N'RAJ', N'WARDHA', N'45687469756', N'raj@gmail.com', 1, 1, N'1234', CAST(N'2017-03-02 00:19:50.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (7, N'1000', N'LALIT', N'PREM NAGAR', N'4697543797', N'lalit@gmail.com', 1, 1, N'11234', CAST(N'2017-03-02 00:31:21.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10002, N'12237', N'GDWG', N'HXJD', N'89897', N'ptgdp@mgag', 1, 1, N'GMXJ', CAST(N'2017-03-07 16:12:56.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10004, N'GWPDT', N'PWJDT', N'PWJDT', N'8983', N'pwjdt', 1, 1, N'GWPDT', CAST(N'2017-03-07 16:36:08.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10005, N'GDMT', N'PNWJ', N'JDWT', N'8606', N'pmt', 1, 1, N'GMTM', CAST(N'2017-03-08 18:48:56.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10006, N'UJTDT', N'GDMT', N'UBT', N'8668', N'pkt', 1, 1, N'TADPDT', CAST(N'2017-03-09 17:25:07.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10007, N'ATNGG', N'GNOG', N'JGJGAG', N'59868', N'gtpmp', 1, 1, N'TPMJWT', CAST(N'2017-03-09 22:25:09.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10008, N'GGDP', N'PMPMPJ', N'MPPJPAP', N'8886868', N'pqjn', 1, 1, N'DPPJMTTM', CAST(N'2017-03-09 22:33:21.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10009, N'12345', N'LALIT INGALE', N'NAGPUR', N'9890122628', N'lalitingale@gmail.com', 1, 2, N'LALIT', CAST(N'2017-03-09 23:33:21.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10010, N'JJN', N'MGPMPM', N'MPPJM', N'35566', N'mqmtmn', 1, 1, N'GHMPM', CAST(N'2017-03-09 23:38:14.000' AS DateTime))
INSERT [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo], [EmployeeTokenNo], [EmployeeName], [EmployeeAddress], [EmployeeContactNo], [EmployeeEmailID], [EmployeeDepartmentID], [EmployeeDesignationID], [EmployeePassword], [Date]) VALUES (10011, N'pm', N'MNOPM', N'DGMPJ', N'656866', N'mntn', 1, 2, N'pm', CAST(N'2017-03-09 23:44:25.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_DepartmentEmployeeRegistration] OFF
SET IDENTITY_INSERT [dbo].[tbl_DepartmentMaster] ON 

INSERT [dbo].[tbl_DepartmentMaster] ([DepartmentID], [DepartmentName], [DepartmentCreateDate]) VALUES (1, N'Engineer Service', CAST(N'2017-03-02 00:15:37.820' AS DateTime))
INSERT [dbo].[tbl_DepartmentMaster] ([DepartmentID], [DepartmentName], [DepartmentCreateDate]) VALUES (2, N'Safety', CAST(N'2017-03-08 16:16:16.020' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_DepartmentMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_DesignationMaster] ON 

INSERT [dbo].[tbl_DesignationMaster] ([DesignationID], [DepartmentID], [DesignationName], [DesignationCreateDate]) VALUES (1, 1, N'Activity Owner', CAST(N'2017-03-02 00:15:37.820' AS DateTime))
INSERT [dbo].[tbl_DesignationMaster] ([DesignationID], [DepartmentID], [DesignationName], [DesignationCreateDate]) VALUES (2, 1, N'Area Owner', CAST(N'2017-03-08 16:16:00.240' AS DateTime))
INSERT [dbo].[tbl_DesignationMaster] ([DesignationID], [DepartmentID], [DesignationName], [DesignationCreateDate]) VALUES (4, 1, N'Safety', CAST(N'2017-03-15 22:17:25.400' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_DesignationMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_RequestProcess] ON 

INSERT [dbo].[tbl_RequestProcess] ([EmployeeId], [RequestProcessSrNo], [VisitorSrNo], [EmployeeDepartmentID], [VisitStartTime], [VisitEndTime], [VisitorAccessories], [NoOfVisitors], [VisitorVisitResons], [RequestProcessDate], [ActivityOwnerStatus], [AreaOwnerStatus], [SafetyStatus], [ContractorStatus]) VALUES (10009, 1, 1, 1, CAST(N'2017-03-15 15:06:00.000' AS DateTime), CAST(N'2017-03-15 17:06:00.000' AS DateTime), N'LAPTOP', 5, N'AS USUAL', CAST(N'2017-03-15 15:07:07.000' AS DateTime), N'None', N'None', N'None', N'None')
INSERT [dbo].[tbl_RequestProcess] ([EmployeeId], [RequestProcessSrNo], [VisitorSrNo], [EmployeeDepartmentID], [VisitStartTime], [VisitEndTime], [VisitorAccessories], [NoOfVisitors], [VisitorVisitResons], [RequestProcessDate], [ActivityOwnerStatus], [AreaOwnerStatus], [SafetyStatus], [ContractorStatus]) VALUES (7, 2, 1, 1, CAST(N'2017-03-15 20:05:00.000' AS DateTime), CAST(N'2017-03-15 14:05:00.000' AS DateTime), N'LAPTOP', 2, N'K', CAST(N'2017-03-15 22:05:47.000' AS DateTime), N'None', N'None', N'None', N'None')
INSERT [dbo].[tbl_RequestProcess] ([EmployeeId], [RequestProcessSrNo], [VisitorSrNo], [EmployeeDepartmentID], [VisitStartTime], [VisitEndTime], [VisitorAccessories], [NoOfVisitors], [VisitorVisitResons], [RequestProcessDate], [ActivityOwnerStatus], [AreaOwnerStatus], [SafetyStatus], [ContractorStatus]) VALUES (10009, 4, 1, 1, CAST(N'2017-03-15 15:06:00.000' AS DateTime), CAST(N'2017-03-15 17:06:00.000' AS DateTime), N'LAPTOP', 5, N'AS USUAL', CAST(N'2017-03-15 15:07:07.000' AS DateTime), N'Accepted', N'None', N'None', N'None')
INSERT [dbo].[tbl_RequestProcess] ([EmployeeId], [RequestProcessSrNo], [VisitorSrNo], [EmployeeDepartmentID], [VisitStartTime], [VisitEndTime], [VisitorAccessories], [NoOfVisitors], [VisitorVisitResons], [RequestProcessDate], [ActivityOwnerStatus], [AreaOwnerStatus], [SafetyStatus], [ContractorStatus]) VALUES (10009, 5, 1, 1, CAST(N'2017-03-15 15:06:00.000' AS DateTime), CAST(N'2017-03-15 17:06:00.000' AS DateTime), N'LAPTOP', 5, N'AS USUAL', CAST(N'2017-03-15 15:07:07.000' AS DateTime), N'Accepted', N'Decline', N'None', N'None')
SET IDENTITY_INSERT [dbo].[tbl_RequestProcess] OFF
SET IDENTITY_INSERT [dbo].[tbl_VisitorUserRegistration] ON 

INSERT [dbo].[tbl_VisitorUserRegistration] ([VisitorSrNo], [VisitorUserID], [VisitorName], [VisitorAddress], [VisitorContactNo], [VisitorEmailID], [VisitorNatureOfWork], [VisitorContractor], [VisitorContractorCoNo], [VisitorPassword], [VisitorRegistrationDate]) VALUES (1, N'M&M1', N'DHIRAJ BHALME', N'NAGPUR', N' ', N'dhirajbhalme15@gmai.com', N'ABC', N'COALTECH', N' ', N'123', CAST(N'2017-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_VisitorUserRegistration] ([VisitorSrNo], [VisitorUserID], [VisitorName], [VisitorAddress], [VisitorContactNo], [VisitorEmailID], [VisitorNatureOfWork], [VisitorContractor], [VisitorContractorCoNo], [VisitorPassword], [VisitorRegistrationDate]) VALUES (2, N'M&M2', N'ROHAN', N'NANDANWAN', N'1234567890', N'rohan@gmail.com', N'QMG', N'COAL', N'7539512854', N'123', CAST(N'2017-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_VisitorUserRegistration] ([VisitorSrNo], [VisitorUserID], [VisitorName], [VisitorAddress], [VisitorContactNo], [VisitorEmailID], [VisitorNatureOfWork], [VisitorContractor], [VisitorContractorCoNo], [VisitorPassword], [VisitorRegistrationDate]) VALUES (3, N'M&M3', N'PRASAD', N'PUSAD', N'956784345', N'prasad@gmail.com', N'GM', N'GMTJ', N'97767379764', N'123', CAST(N'2017-03-02 00:18:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_VisitorUserRegistration] OFF
ALTER TABLE [dbo].[tbl_DepartmentEmployeeRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DepartmentEmployeeRegistration_tbl_DepartmentMaster] FOREIGN KEY([EmployeeDepartmentID])
REFERENCES [dbo].[tbl_DepartmentMaster] ([DepartmentID])
GO
ALTER TABLE [dbo].[tbl_DepartmentEmployeeRegistration] CHECK CONSTRAINT [FK_tbl_DepartmentEmployeeRegistration_tbl_DepartmentMaster]
GO
ALTER TABLE [dbo].[tbl_DepartmentEmployeeRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DepartmentEmployeeRegistration_tbl_DesignationMaster] FOREIGN KEY([EmployeeDesignationID])
REFERENCES [dbo].[tbl_DesignationMaster] ([DesignationID])
GO
ALTER TABLE [dbo].[tbl_DepartmentEmployeeRegistration] CHECK CONSTRAINT [FK_tbl_DepartmentEmployeeRegistration_tbl_DesignationMaster]
GO
ALTER TABLE [dbo].[tbl_RequestProcess]  WITH CHECK ADD  CONSTRAINT [FK_tbl_RequestProcess_tbl_DepartmentEmployeeRegistration] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tbl_DepartmentEmployeeRegistration] ([EmployeeSrNo])
GO
ALTER TABLE [dbo].[tbl_RequestProcess] CHECK CONSTRAINT [FK_tbl_RequestProcess_tbl_DepartmentEmployeeRegistration]
GO
ALTER TABLE [dbo].[tbl_RequestProcess]  WITH CHECK ADD  CONSTRAINT [FK_tbl_RequestProcess_tbl_VisitorUserRegistration] FOREIGN KEY([VisitorSrNo])
REFERENCES [dbo].[tbl_VisitorUserRegistration] ([VisitorSrNo])
GO
ALTER TABLE [dbo].[tbl_RequestProcess] CHECK CONSTRAINT [FK_tbl_RequestProcess_tbl_VisitorUserRegistration]
GO
USE [master]
GO
ALTER DATABASE [ManageVisitors] SET  READ_WRITE 
GO
