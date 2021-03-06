USE [Libreria]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_SubGenero]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Pais]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT IF EXISTS [FK_Libro_Idiomas]
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
/****** Object:  Table [dbo].[SubGenero]    Script Date: 20/10/2018 08:41:32 a. m. ******/
DROP TABLE IF EXISTS [dbo].[SubGenero]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 20/10/2018 08:41:32 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Pais]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 20/10/2018 08:41:32 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Libro]
GO
/****** Object:  Table [dbo].[Idiomas]    Script Date: 20/10/2018 08:41:32 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Idiomas]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 20/10/2018 08:41:32 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Genero]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 20/10/2018 08:41:32 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Editorial]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 20/10/2018 08:41:32 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Autor]
GO
USE [master]
GO
/****** Object:  Database [Libreria]    Script Date: 20/10/2018 08:41:32 a. m. ******/
DROP DATABASE IF EXISTS [Libreria]
GO
/****** Object:  Database [Libreria]    Script Date: 20/10/2018 08:41:32 a. m. ******/
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
/****** Object:  Table [dbo].[Autor]    Script Date: 20/10/2018 08:41:32 a. m. ******/
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
/****** Object:  Table [dbo].[Editorial]    Script Date: 20/10/2018 08:41:33 a. m. ******/
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
/****** Object:  Table [dbo].[Genero]    Script Date: 20/10/2018 08:41:33 a. m. ******/
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
/****** Object:  Table [dbo].[Idiomas]    Script Date: 20/10/2018 08:41:33 a. m. ******/
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
/****** Object:  Table [dbo].[Libro]    Script Date: 20/10/2018 08:41:33 a. m. ******/
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
	[Id_SubGen] [uniqueidentifier] NOT NULL,
	[Id_Editorial] [uniqueidentifier] NOT NULL,
	[Id_Idioma] [uniqueidentifier] NOT NULL,
	[Id_Pais] [uniqueidentifier] NOT NULL,
	[Fecha_Lanzamiento] [date] NOT NULL,
	[Paginas] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Existenca] [tinyint] NOT NULL,
	[Edicion] [tinyint] NOT NULL,
	[ISBN] [varchar](50) NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[Id_Libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 20/10/2018 08:41:33 a. m. ******/
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
/****** Object:  Table [dbo].[SubGenero]    Script Date: 20/10/2018 08:41:33 a. m. ******/
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
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'0348aaf2-1f4b-46a4-9643-01db7d31a2aa', N'Henry', N'Rider', N'Haggard')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'6c7220ef-a39e-451e-96c6-287696092470', N'Jerome', N'David', N'Salinger')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'792020e9-3fd1-4819-bb05-378539b8fba3', N'Jiang', N'Zemin', N'')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'7f96df50-7917-49ef-bbb6-4cb4153182b3', N'Cao', N'Xueqin', N'')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'e2bd29a7-0476-49c0-a0de-53ced9b3651e', N'Miguel', N'de Cervantes', N'Saavedra')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'043cd167-938d-4e38-a5f6-82a4c5cad11d', N'Clive', N'Staples', N'Lewis')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'fd43bf8a-677d-423b-93f9-9be82d4b9a11', N'Charles', N'Lutwidge', N'Dodgson')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'3e759217-c352-4cee-b6e5-cd8ffb9a1811', N'John Ronald', N'Reuel', N'Tolkien')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'b26d1646-25df-4486-9364-d6af5fecd521', N'Antoine Marie', N'Jean-Baptiste', N'Roger')
INSERT [dbo].[Autor] ([Id_Autor], [Nom_Autor], [Ap_Pat], [Ap_Mat]) VALUES (N'6a26df60-19e0-4efd-bf78-e48075f84889', N'Charles John', N'Huffam', N'Dickens')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'91e44f04-1714-4127-a1d9-0e1d2057289e', N'Atalanta')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'39c7adb7-7490-493f-91ad-0ebcd07e7247', N'Alpha Decay')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'707a95fe-abc1-4f17-b71a-14262b6fb242', N'Galaxia Gutenberg')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'85881fe4-5031-444f-a554-1bbc4e730c36', N'La esfera de los libros')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'8de7a71f-c1d6-4981-9686-2092ce142c55', N'Aguilar')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'0affe4e0-609c-4c85-82b9-42334f438657', N'Phaidon')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'71efb7a2-62a8-4416-a786-7c32a01336e4', N'Paidós')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'0da3feee-5d9b-45ae-8973-af462e48a196', N'Satori')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'898ada5f-ac1d-427a-b099-b5dd83721353', N'Salamandra')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'883d27bb-ff12-448e-b827-bba0a14da83d', N'Alfaguara')
INSERT [dbo].[Editorial] ([IdEditorial], [Nom_Editorial]) VALUES (N'af9c29ee-ac01-497d-878b-cde82879ba83', N'Library of America')
INSERT [dbo].[Genero] ([Id_Genero], [Nom_Gen]) VALUES (N'3bee082c-cca8-4ca1-854a-180629c4d7e7', N'Novela')
INSERT [dbo].[Genero] ([Id_Genero], [Nom_Gen]) VALUES (N'6f50d6c0-c4d3-4a70-8dc8-1e11148e0a2b', N'Didactico')
INSERT [dbo].[Genero] ([Id_Genero], [Nom_Gen]) VALUES (N'e1b3cbf0-f9ae-46d8-9f94-6b0833ee9194', N'Dramatico')
INSERT [dbo].[Genero] ([Id_Genero], [Nom_Gen]) VALUES (N'9169b0fc-2da7-4d6f-b9c9-f1290f1779a7', N'Lirico')
INSERT [dbo].[Idiomas] ([Id_Idioma], [Nom_Idioma]) VALUES (N'029c1335-c4f1-466b-be67-12fdd9230f84', N'Chino')
INSERT [dbo].[Idiomas] ([Id_Idioma], [Nom_Idioma]) VALUES (N'3ee25b09-8229-4469-a48e-34c3cdd5c4af', N'Ingles')
INSERT [dbo].[Idiomas] ([Id_Idioma], [Nom_Idioma]) VALUES (N'e3b7414a-7d3b-47c4-8d83-d83993412cc8', N'Español')
INSERT [dbo].[Idiomas] ([Id_Idioma], [Nom_Idioma]) VALUES (N'06364e03-9644-4d99-bfc8-f93b67f24005', N'Frances')
INSERT [dbo].[Libro] ([Id_Libro], [Titulo], [Id_Autor], [Id_Genero], [Id_SubGen], [Id_Editorial], [Id_Idioma], [Id_Pais], [Fecha_Lanzamiento], [Paginas], [Descripcion], [Existenca], [Edicion], [ISBN], [Status]) VALUES (N'0ef28290-1e7d-4ee0-b97b-4afe08db3421', N'Libro2', N'6c7220ef-a39e-451e-96c6-287696092470', N'3bee082c-cca8-4ca1-854a-180629c4d7e7', N'd8bbf69c-d0ff-484c-ad94-54f8b8d62472', N'39c7adb7-7490-493f-91ad-0ebcd07e7247', N'3ee25b09-8229-4469-a48e-34c3cdd5c4af', N'272d4c97-c201-4483-9128-4bfd5a0f2dec', CAST(N'2018-10-02' AS Date), 100, N'Esto es un Libro', 1, 1, N'100-100-002', 1)
INSERT [dbo].[Libro] ([Id_Libro], [Titulo], [Id_Autor], [Id_Genero], [Id_SubGen], [Id_Editorial], [Id_Idioma], [Id_Pais], [Fecha_Lanzamiento], [Paginas], [Descripcion], [Existenca], [Edicion], [ISBN], [Status]) VALUES (N'91eb90f9-f400-4735-888b-6aa16849b13e', N'Libro3', N'792020e9-3fd1-4819-bb05-378539b8fba3', N'6f50d6c0-c4d3-4a70-8dc8-1e11148e0a2b', N'aacf143a-de78-4cc5-8916-65ccf840c593', N'707a95fe-abc1-4f17-b71a-14262b6fb242', N'e3b7414a-7d3b-47c4-8d83-d83993412cc8', N'f9516cd9-af9b-453f-a7e8-6136aa03a1c7', CAST(N'2018-10-03' AS Date), 100, N'Esto es un Libro', 1, 1, N'100-100-002', 1)
INSERT [dbo].[Libro] ([Id_Libro], [Titulo], [Id_Autor], [Id_Genero], [Id_SubGen], [Id_Editorial], [Id_Idioma], [Id_Pais], [Fecha_Lanzamiento], [Paginas], [Descripcion], [Existenca], [Edicion], [ISBN], [Status]) VALUES (N'e307fe07-846d-439f-a373-70c45eb2283b', N'Libro1', N'0348aaf2-1f4b-46a4-9643-01db7d31a2aa', N'9169b0fc-2da7-4d6f-b9c9-f1290f1779a7', N'b7956846-f446-493a-b4e4-1fc100d67f43', N'91e44f04-1714-4127-a1d9-0e1d2057289e', N'029c1335-c4f1-466b-be67-12fdd9230f84', N'22218ebb-4187-4860-be7a-7fecdbc917b5', CAST(N'2018-10-04' AS Date), 400, N'Esto es un Libro4', 4, 1, N'100-100-004', 1)
INSERT [dbo].[Libro] ([Id_Libro], [Titulo], [Id_Autor], [Id_Genero], [Id_SubGen], [Id_Editorial], [Id_Idioma], [Id_Pais], [Fecha_Lanzamiento], [Paginas], [Descripcion], [Existenca], [Edicion], [ISBN], [Status]) VALUES (N'1e212e2b-f78f-41b0-99fc-7f5df78e047e', N'Libro5', N'6a26df60-19e0-4efd-bf78-e48075f84889', N'9169b0fc-2da7-4d6f-b9c9-f1290f1779a7', N'864a8adb-f2ff-4e0e-82f5-e6ccf7e26f41', N'af9c29ee-ac01-497d-878b-cde82879ba83', N'06364e03-9644-4d99-bfc8-f93b67f24005', N'a95a47ba-647a-4b4e-a186-b1801989ea78', CAST(N'2018-10-05' AS Date), 500, N'Ejemplo de un Libro', 5, 1, N'100-100-005', 1)
INSERT [dbo].[Libro] ([Id_Libro], [Titulo], [Id_Autor], [Id_Genero], [Id_SubGen], [Id_Editorial], [Id_Idioma], [Id_Pais], [Fecha_Lanzamiento], [Paginas], [Descripcion], [Existenca], [Edicion], [ISBN], [Status]) VALUES (N'a099f5dd-4845-4841-9de0-de782b03bec3', N'Libro1', N'0348aaf2-1f4b-46a4-9643-01db7d31a2aa', N'9169b0fc-2da7-4d6f-b9c9-f1290f1779a7', N'b7956846-f446-493a-b4e4-1fc100d67f43', N'91e44f04-1714-4127-a1d9-0e1d2057289e', N'029c1335-c4f1-466b-be67-12fdd9230f84', N'baaf1940-a726-4db4-8927-16eb895cfe4e', CAST(N'2018-10-01' AS Date), 100, N'Esto es un Libro', 1, 1, N'100-100-001', 1)
INSERT [dbo].[Pais] ([IdPais], [Nom_Pais], [Cod_Pais]) VALUES (N'baaf1940-a726-4db4-8927-16eb895cfe4e', N'Francia', N'FRA')
INSERT [dbo].[Pais] ([IdPais], [Nom_Pais], [Cod_Pais]) VALUES (N'272d4c97-c201-4483-9128-4bfd5a0f2dec', N'México', N'MEX')
INSERT [dbo].[Pais] ([IdPais], [Nom_Pais], [Cod_Pais]) VALUES (N'f9516cd9-af9b-453f-a7e8-6136aa03a1c7', N'Estados Unidos', N'USA')
INSERT [dbo].[Pais] ([IdPais], [Nom_Pais], [Cod_Pais]) VALUES (N'22218ebb-4187-4860-be7a-7fecdbc917b5', N'Reino Unido', N'GBR')
INSERT [dbo].[Pais] ([IdPais], [Nom_Pais], [Cod_Pais]) VALUES (N'ecff7c28-c938-428e-af66-aae71d9f038b', N'China', N'CHN')
INSERT [dbo].[Pais] ([IdPais], [Nom_Pais], [Cod_Pais]) VALUES (N'a95a47ba-647a-4b4e-a186-b1801989ea78', N'España', N'ESP')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'b7956846-f446-493a-b4e4-1fc100d67f43', N'Accion')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'd8bbf69c-d0ff-484c-ad94-54f8b8d62472', N'Oda')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'aacf143a-de78-4cc5-8916-65ccf840c593', N'Cuento')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'ee48e422-148e-495c-8e73-6a1017a4e549', N'Historica')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'3b3170cd-205f-48b6-a088-7a43d6e18ef0', N'Tragedia')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'0149f32f-d037-4776-8f9c-957e5fbb4491', N'Caballerias ')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'202f8533-35c9-4bac-a039-b091c70852ac', N'Aventuras')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'c5f8e2e2-0a20-46ff-920e-b424e3e3870f', N'Fantasia')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'be2bb1dc-789b-485c-baf1-bb25675ce007', N'Social')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'a7e35d27-75a9-4101-8e98-c60b2ffdfc0f', N'Comedia')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'aa7339c6-b6ed-4b1f-9470-c9535b78ed5e', N'Fabula')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'a0ec02a6-9e87-4d7b-8685-d12d971042fa', N'Romance')
INSERT [dbo].[SubGenero] ([Id_SubGen], [Nom_SubGen]) VALUES (N'864a8adb-f2ff-4e0e-82f5-e6ccf7e26f41', N'Realista')
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Idiomas]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Idiomas] FOREIGN KEY([Id_Idioma])
REFERENCES [dbo].[Idiomas] ([Id_Idioma])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Idiomas]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Idiomas]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Pais]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Pais] FOREIGN KEY([Id_Pais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_Pais]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Pais]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_SubGenero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_SubGenero] FOREIGN KEY([Id_SubGen])
REFERENCES [dbo].[SubGenero] ([Id_SubGen])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Libro_SubGenero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Libro]'))
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_SubGenero]
GO
USE [master]
GO
ALTER DATABASE [Libreria] SET  READ_WRITE 
GO
