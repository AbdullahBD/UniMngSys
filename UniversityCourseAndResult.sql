USE [master]
GO
/****** Object:  Database [UniversityCourseAndResult]    Script Date: 25-Jul-16 9:36:17 PM ******/
CREATE DATABASE [UniversityCourseAndResult]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityCourseAndResult', FILENAME = N'E:\Personal\Visual C#\BITM\Home File\UniversityCourseAndResultManagement\UniversityCourseAndResult.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityCourseAndResult_log', FILENAME = N'E:\Personal\Visual C#\BITM\Home File\UniversityCourseAndResultManagement\UniversityCourseAndResult_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityCourseAndResult] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityCourseAndResult].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityCourseAndResult] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseAndResult] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseAndResult] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityCourseAndResult] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityCourseAndResult] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityCourseAndResult] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityCourseAndResult] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityCourseAndResult] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityCourseAndResult] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityCourseAndResult] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityCourseAndResult] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityCourseAndResult]
GO
/****** Object:  Table [dbo].[ClassRoom]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClassRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClassroomAllocation]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassroomAllocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeptId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomNo] [varchar](50) NOT NULL,
	[Day] [varchar](50) NOT NULL,
	[From] [varchar](50) NOT NULL,
	[To] [varchar](50) NOT NULL,
	[Valid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClassroomAllocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignment]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Valid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourseAssignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseEnrollment]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseEnrollment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Grade] [varchar](50) NOT NULL,
	[Valid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourseEnrollment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[RegDate] [date] NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[DeptId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 25-Jul-16 9:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditTaken] [decimal](18, 2) NOT NULL,
	[RemainingCredit] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (3, N'CSE-101', N'Computer Fundamental', CAST(3.00 AS Decimal(18, 2)), N'Basic Knowledge on Computer', 0, 0)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1004, N'ETE', N'Electric and Telecommunication Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1007, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1008, N'EEE', N'Electric and Electronic Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1009, N'BBA', N'Bachelor of Business Administration')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [DesignationName]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([Id], [DesignationName]) VALUES (2, N'Assistant Professor')
INSERT [dbo].[Designation] ([Id], [DesignationName]) VALUES (3, N'Associate Professor')
INSERT [dbo].[Designation] ([Id], [DesignationName]) VALUES (4, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([Id], [SemesterName]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([Id], [SemesterName]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([Id], [SemesterName]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([Id], [SemesterName]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([Id], [SemesterName]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([Id], [SemesterName]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([Id], [SemesterName]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([Id], [SemesterName]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (1, N'Md. Arif Hasnain', N'Oxygen, Chittagong', N'arifhasnain@gmail.com', N'', 0, 0, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (2, N'Md. Khalilujjaman', N'South Khulshi, Chittagong', N'khalil_01@yahoo.com', N'', 0, 0, CAST(40.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
USE [master]
GO
ALTER DATABASE [UniversityCourseAndResult] SET  READ_WRITE 
GO
