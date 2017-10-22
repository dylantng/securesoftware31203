USE [master]
GO
/****** Object:  Database [ICT3103]    Script Date: 21-Oct-17 10:55:05 PM ******/
CREATE DATABASE [ICT3103]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ICT3103', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ICT3103.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ICT3103_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\ICT3103_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ICT3103] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ICT3103].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ICT3103] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ICT3103] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ICT3103] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ICT3103] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ICT3103] SET ARITHABORT OFF 
GO
ALTER DATABASE [ICT3103] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ICT3103] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ICT3103] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ICT3103] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ICT3103] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ICT3103] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ICT3103] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ICT3103] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ICT3103] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ICT3103] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ICT3103] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ICT3103] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ICT3103] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ICT3103] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ICT3103] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ICT3103] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ICT3103] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ICT3103] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ICT3103] SET  MULTI_USER 
GO
ALTER DATABASE [ICT3103] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ICT3103] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ICT3103] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ICT3103] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ICT3103] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ICT3103] SET QUERY_STORE = OFF
GO
USE [ICT3103]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ICT3103]
GO
/****** Object:  Table [dbo].[ca1]    Script Date: 21-Oct-17 10:55:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ca1](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[publickeyfile] [varbinary](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ca2]    Script Date: 21-Oct-17 10:55:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ca2](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[publickeyfile] [varbinary](50) NOT NULL,
	[status] [varchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileStorage]    Script Date: 21-Oct-17 10:55:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileStorage](
	[username] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[file] [varbinary](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ca1] ([username], [password], [publickeyfile]) VALUES (N'hz', N'	%›èg–cØ·ÿ£¤c’T<5ŸýÅhS‰Rø®îwÅÈýì«~eì$¦˜¡ø>0¤‰YR²*ß PÄµÂoô™', 0x0000000A)
INSERT [dbo].[ca2] ([username], [password], [publickeyfile], [status]) VALUES (N'hz', N'	%›èg–cØ·ÿ£¤c’T<5ŸýÅhS‰Rø®îwÅÈýì«~eì$¦˜¡ø>0¤‰YR²*ß PÄµÂoô™', 0x0000000A, N'disable')
INSERT [dbo].[ca2] ([username], [password], [publickeyfile], [status]) VALUES (N'123', N'ÍŒ)¸Þí2?áSŒûÛFü*.¦ýg€)pŽ¢¦á:)ÞóÈ7ÄçòÈàuhã#h''ÞûÉ4nGkn•D@©§', 0x0000000A, N'active')
USE [master]
GO
ALTER DATABASE [ICT3103] SET  READ_WRITE 
GO
