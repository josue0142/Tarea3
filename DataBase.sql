USE [master]
GO
/****** Object:  Database [DBStudents]    Script Date: 16/2/2020 11:46:14 p.m. ******/
CREATE DATABASE [DBStudents]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBStudents', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\DBStudents.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBStudents_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\DBStudents_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBStudents] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBStudents].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBStudents] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBStudents] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBStudents] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBStudents] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBStudents] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBStudents] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBStudents] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBStudents] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBStudents] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBStudents] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBStudents] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBStudents] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBStudents] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBStudents] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBStudents] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBStudents] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBStudents] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBStudents] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBStudents] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBStudents] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBStudents] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBStudents] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBStudents] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBStudents] SET  MULTI_USER 
GO
ALTER DATABASE [DBStudents] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBStudents] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBStudents] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBStudents] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBStudents] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBStudents] SET QUERY_STORE = OFF
GO
USE [DBStudents]
GO
/****** Object:  Table [dbo].[Career]    Script Date: 16/2/2020 11:46:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Career](
	[CareerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Career] PRIMARY KEY CLUSTERED 
(
	[CareerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 16/2/2020 11:46:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Status] [varchar](2) NOT NULL,
	[CareerFk] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Career] FOREIGN KEY([CareerFk])
REFERENCES [dbo].[Career] ([CareerId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Career]
GO
USE [master]
GO
ALTER DATABASE [DBStudents] SET  READ_WRITE 
GO
