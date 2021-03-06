USE [Libreria]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Genero]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Editorial]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Autor]
GO
/****** Object:  Table [dbo].[SubGenero]    Script Date: 13/10/2018 09:47:25 a. m. ******/
DROP TABLE IF EXISTS [dbo].[SubGenero]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 13/10/2018 09:47:25 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Pais]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 13/10/2018 09:47:25 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Libro]
GO
/****** Object:  Table [dbo].[Idiomas]    Script Date: 13/10/2018 09:47:25 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Idiomas]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 13/10/2018 09:47:25 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Genero]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 13/10/2018 09:47:25 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Editorial]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 13/10/2018 09:47:25 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Autor]
GO
USE [master]
GO
/****** Object:  Database [Libreria]    Script Date: 13/10/2018 09:47:25 a. m. ******/
DROP DATABASE IF EXISTS [Libreria]
GO
/****** Object:  Database [Libreria]    Script Date: 13/10/2018 09:47:25 a. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Libreria')
BEGIN
CREATE DATABASE [Libreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Libreria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Libreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Libreria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Libreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [Libreria] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Libreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Libreria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Libreria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Libreria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Libreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Libreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Libreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Libreria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Libreria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Libreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Libreria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Libreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Libreria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Libreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Libreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Libreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Libreria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Libreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Libreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Libreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Libreria] SET RECOVERY FULL 
GO
ALTER DATABASE [Libreria] SET  MULTI_USER 
GO
ALTER DATABASE [Libreria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Libreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Libreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Libreria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Libreria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Libreria] SET QUERY_STORE = OFF
GO
USE [Libreria]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [Libreria]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 13/10/2018 09:47:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Autor](
	[Id_Autor] [uniqueidentifier] NOT NULL,
	[Nom_Autor] [varchar](20) NOT NULL,
	[Ap_Pat] [varchar](20) NULL,
	[Ap_Mat] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 13/10/2018 09:47:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Editorial]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [uniqueidentifier] NOT NULL,
	[Nom_Editorial] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 13/10/2018 09:47:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genero](
	[Id_Genero] [uniqueidentifier] NOT NULL,
	[Nom_Gen] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Idiomas]    Script Date: 13/10/2018 09:47:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idiomas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Idiomas](
	[Id_Idioma] [uniqueidentifier] NOT NULL,
	[Nom_Idioma] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 13/10/2018 09:47:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Libro](
	[Id_Libro] [uniqueidentifier] NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Id_Autor] [uniqueidentifier] NOT NULL,
	[Id_Genero] [uniqueidentifier] NOT NULL,
	[Fecha_Lanzamiento] [date] NOT NULL,
	[Paginas] [tinyint] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Existencia] [tinyint] NOT NULL,
	[Edicion] [tinyint] NOT NULL,
	[Id_Editorial] [uniqueidentifier] NOT NULL,
	[ISBN] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[Id_Libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 13/10/2018 09:47:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pais]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pais](
	[IdPais] [uniqueidentifier] NOT NULL,
	[Nom_Pais] [varchar](15) NULL,
	[Cod_Pais] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SubGenero]    Script Date: 13/10/2018 09:47:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubGenero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubGenero](
	[Id_SubGen] [uniqueidentifier] NOT NULL,
	[Nom_SubGen] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_SubGen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Autor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Autor] FOREIGN KEY([Id_Autor])
REFERENCES [dbo].[Autor] ([Id_Autor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Autor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Autor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Editorial]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Editorial] FOREIGN KEY([Id_Editorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Editorial]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Editorial]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Genero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Genero] FOREIGN KEY([Id_Genero])
REFERENCES [dbo].[Genero] ([Id_Genero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Genero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Genero]
GO
USE [master]
GO
ALTER DATABASE [Libreria] SET  READ_WRITE 
GO
