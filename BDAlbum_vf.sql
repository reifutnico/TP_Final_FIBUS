USE [master]
GO
/****** Object:  Database [BDAlbum]    Script Date: 22/4/2024 09:58:20 ******/
CREATE DATABASE [BDAlbum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDAlbum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDAlbum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDAlbum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDAlbum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDAlbum] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDAlbum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDAlbum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDAlbum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDAlbum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDAlbum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDAlbum] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDAlbum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDAlbum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDAlbum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDAlbum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDAlbum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDAlbum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDAlbum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDAlbum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDAlbum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDAlbum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDAlbum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDAlbum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDAlbum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDAlbum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDAlbum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDAlbum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDAlbum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDAlbum] SET RECOVERY FULL 
GO
ALTER DATABASE [BDAlbum] SET  MULTI_USER 
GO
ALTER DATABASE [BDAlbum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDAlbum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDAlbum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDAlbum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDAlbum] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDAlbum', N'ON'
GO
ALTER DATABASE [BDAlbum] SET QUERY_STORE = OFF
GO
USE [BDAlbum]
GO
/****** Object:  User [alumno]    Script Date: 22/4/2024 09:58:20 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[IdEquipo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Insigna] [varchar](100) NULL,
	[Imagen] [varchar](500) NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[IdEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Figuritas]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Figuritas](
	[IdFigurita] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ImagenJugador] [varchar](500) NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[IdEquipo] [int] NOT NULL,
	[Apellido] [varchar](50) NULL,
 CONSTRAINT [PK_Figuritas] PRIMARY KEY CLUSTERED 
(
	[IdFigurita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdInventario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[IdInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventarioXFigus]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioXFigus](
	[IdInventario] [int] NOT NULL,
	[IdFigurita] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mercado]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mercado](
	[IdFigurita] [int] NOT NULL,
	[IdInventario] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sobres]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sobres](
	[IdSobre] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Foto] [varchar](100) NOT NULL,
	[Valor] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha_Fin] [int] NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Sobres] PRIMARY KEY CLUSTERED 
(
	[IdSobre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contraseña] [varchar](500) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Monedas] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Equipo] ON 

INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (1, N'Diarco United', N'.', N'escDiar.png')
INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (2, N'Argentina', N'.', N'escArg.png')
INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (3, N'Ecuador', N'.', N'escEcupng')
INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (4, N'Uruguay', N'.', N'escUru.png')
INSERT [dbo].[Equipo] ([IdEquipo], [Nombre], [Insigna], [Imagen]) VALUES (5, N'Leyendas', N'.', N'.')
SET IDENTITY_INSERT [dbo].[Equipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Figuritas] ON 

INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (1, N'Escudo diarco', N'escudo_diarco.jpg', N'Brillante', 2, 0, 1, N'')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (2, N'Axel', N'figurita_axel.jpg', N'Comun', 2, 1, 1, N'Kleiman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (3, N'Nicolas', N'figurita_becher.jpg', N'Comun', 1, 2, 1, N'Becherman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (4, N'Julian', N'figurita_huevo.jpg', N'Brillante', 2, 3, 1, N'Wegman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (5, N'Matias', N'figurita_mata.jpg', N'Comun', 1, 4, 1, N'Mata')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (6, N'Federico', N'figurita_zober.jpg', N'Comun', 1, 5, 1, N'Zoberman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (7, N'Ivan', N'figurita_ivo.jpg', N'Comun', 1, 6, 1, N'Latascheff')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (8, N'Federico', N'figurita_zorro.jpg', N'Comun', 1, 7, 1, N'Liberman')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (9, N'Nicolas', N'figurita_reifut.jpg', N'Comun', 1, 8, 1, N'Reifut')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (10, N'Tobias', N'figurita_zasel.jpg', N'Comun', 1, 9, 1, N'Zaselsky')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (11, N'Facundo', N'figurita_yuze.jpg', N'Comun', 1, 10, 1, N'Yuzefoff')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (12, N'Escudo argentina', N'escudo_argentina.png', N'Brillante', 2, 11, 2, N'')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (13, N'Lionel', N'figuritas_scaloni.jpg', N'Comun', 1, 12, 2, N'Scaloni')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (14, N'Emiliano', N'dibu.png', N'Comun', 1, 13, 2, N'Martinez')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (15, N'Nicolas', N'figurita_otamendi.jpg', N'Comun', 1, 14, 2, N'Otamendi')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (16, N'Rodrigo', N'depaul.png', N'Comun', 1, 15, 2, N'De Paul')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (17, N'Angel', N'figurita_dimaria.jpg', N'Comun', 1, 16, 2, N'Di Maria')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (18, N'Lionel', N'messi.png', N'Brillante', 2, 17, 2, N'Messi')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (19, N'Escudo Ecuador', N'escudoEcuador.png', N'Brillante', 2, 18, 3, N'')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (20, N'Gustavo', N'alfaro.jpg', N'Brillante', 2, 19, 3, N'Alfaro')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (21, N'Hernan', N'galindez.png', N'Comun', 1, 20, 3, N'Galindez')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (22, N'Pervis', N'estupiñan.png', N'Comun', 1, 21, 3, N'Estupiñan')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (23, N'Moises', N'caicedo.png', N'Comun', 1, 22, 3, N'Caicedo')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (24, N'Enner', N'valencia.png', N'Comun', 1, 23, 3, N'Valencia')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (25, N'Escudo Uruguay', N'EscudoUruguay.png', N'Brillante', 2, 24, 4, N'')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (26, N'Fernando', N'Muslera.png', N'Comun', 2, 25, 4, N'Muslera')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (27, N'Diego', N'godin.png', N'Comun', 1, 26, 4, N'Godin')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (28, N'Ronald', N'araujo.png', N'Comun', 1, 27, 4, N'Araujo')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (29, N'Nahitan', N'nandez.png', N'Brillante', 2, 28, 4, N'Nandez')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (30, N'Luis', N'Suarez.png', N'Comun', 1, 29, 4, N'Suarez')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (31, N'Edinson', N'cavani.png', N'Comun', 1, 30, 4, N'Cavani')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (32, N'Escudo LEYENDAS', N'Icons.png', N'Brillante', 5, 31, 5, N'')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (33, N'Tincho', N'Tincho.jpg', N'Leyenda', 5, 32, 5, N'Reifut')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (34, N'Pablo', N'pablo.jpg', N'Leyenda', 5, 33, 5, N'de hielo')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (35, N'cañete', N'cañete.jpg', N'Leyenda', 5, 34, 5, N'balon de oro')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (36, N'Mata', N'mata.jpg', N'Leyenda', 5, 35, 5, N'Matoskis')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (37, N'Yuco', N'yuco.jpg', N'Leyenda', 5, 36, 5, N'prime')
INSERT [dbo].[Figuritas] ([IdFigurita], [Nombre], [ImagenJugador], [Tipo], [Precio], [Numero], [IdEquipo], [Apellido]) VALUES (38, N'Nicolas', N'Parga.jpg', N'Leyenda', 5, 37, 5, N'Parga')
SET IDENTITY_INSERT [dbo].[Figuritas] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([IdInventario], [IdUsuario]) VALUES (1, 4)
INSERT [dbo].[Inventario] ([IdInventario], [IdUsuario]) VALUES (2, 1024)
INSERT [dbo].[Inventario] ([IdInventario], [IdUsuario]) VALUES (3, 1025)
INSERT [dbo].[Inventario] ([IdInventario], [IdUsuario]) VALUES (4, 1026)
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 24)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 6)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 17)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 33)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 5)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 10)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 9)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 25)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 36)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 4)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 38)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 26)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 29)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 27)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 21)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 31)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 18)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 20)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 30)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 35)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 3)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 28)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 34)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 8)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 22)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 15)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 2)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 23)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (2, 36)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 11)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 37)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 1)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 16)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 19)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 12)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (2, 33)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (2, 13)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (2, 23)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (2, 26)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 32)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 7)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 14)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 13)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 29)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 16)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 15)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 21)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 14)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 18)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 13)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 17)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 30)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 7)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 36)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 9)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 19)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 10)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 35)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 4)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 27)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 1)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 25)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 3)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 23)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 32)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 31)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 5)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 24)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 6)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 21)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 14)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 2)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 24)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 11)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 28)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 34)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 33)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 2)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 22)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (3, 8)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 12)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 18)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 13)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 5)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 19)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 33)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 26)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 17)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 32)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 36)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 11)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 6)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 30)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 10)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 28)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 9)
GO
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 25)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 20)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 4)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 16)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 38)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 25)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 35)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 3)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (4, 1)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 16)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 13)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 38)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 20)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 24)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 19)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 22)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 21)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 17)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 28)
INSERT [dbo].[InventarioXFigus] ([IdInventario], [IdFigurita]) VALUES (1, 29)
GO
INSERT [dbo].[Mercado] ([IdFigurita], [IdInventario], [IdUsuario], [descripcion], [Precio]) VALUES (32, 1, 4, N'efdsf', 33)
INSERT [dbo].[Mercado] ([IdFigurita], [IdInventario], [IdUsuario], [descripcion], [Precio]) VALUES (10, 1, 4, N'ee', 2)
INSERT [dbo].[Mercado] ([IdFigurita], [IdInventario], [IdUsuario], [descripcion], [Precio]) VALUES (12, 1, 4, N'dd', 10)
GO
SET IDENTITY_INSERT [dbo].[Sobres] ON 

INSERT [dbo].[Sobres] ([IdSobre], [Nombre], [Foto], [Valor], [Cantidad], [Fecha_Fin], [Descripcion]) VALUES (2, N'Normal', N'SobreN.png', 4, 3, NULL, N'Este sobre tiene un valor de 4 monedas. Adentro contendra 3 figuritas.')
INSERT [dbo].[Sobres] ([IdSobre], [Nombre], [Foto], [Valor], [Cantidad], [Fecha_Fin], [Descripcion]) VALUES (3, N'Premium', N'SobreP.jpeg', 8, 5, NULL, N'Este tiene un valor de 8 monedas. Adentro contendra 5 figuritas.')
SET IDENTITY_INSERT [dbo].[Sobres] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Contraseña], [Email], [Monedas]) VALUES (4, N'Nicolas', N'Contraseña', N'NicoGmail', 133)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Contraseña], [Email], [Monedas]) VALUES (1024, N'Nicolas2', N'Contraseña2', N'nico@nico', 0)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Contraseña], [Email], [Monedas]) VALUES (1025, N'Nicolas3', N'Contraseña3', N'dss@ss', 11)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Contraseña], [Email], [Monedas]) VALUES (1026, N'Julian', N'Contraseña', N'juliwegman@gmail.com', 3)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Figuritas]  WITH CHECK ADD  CONSTRAINT [FK_Figuritas_Equipo] FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[Figuritas] CHECK CONSTRAINT [FK_Figuritas_Equipo]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Usuario]
GO
ALTER TABLE [dbo].[InventarioXFigus]  WITH CHECK ADD  CONSTRAINT [FK_InventarioXFigus_Figuritas] FOREIGN KEY([IdFigurita])
REFERENCES [dbo].[Figuritas] ([IdFigurita])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InventarioXFigus] CHECK CONSTRAINT [FK_InventarioXFigus_Figuritas]
GO
ALTER TABLE [dbo].[InventarioXFigus]  WITH CHECK ADD  CONSTRAINT [FK_InventarioXFigus_Inventario] FOREIGN KEY([IdInventario])
REFERENCES [dbo].[Inventario] ([IdInventario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InventarioXFigus] CHECK CONSTRAINT [FK_InventarioXFigus_Inventario]
GO
ALTER TABLE [dbo].[Mercado]  WITH CHECK ADD  CONSTRAINT [FK_Mercado_Figuritas] FOREIGN KEY([IdFigurita])
REFERENCES [dbo].[Figuritas] ([IdFigurita])
GO
ALTER TABLE [dbo].[Mercado] CHECK CONSTRAINT [FK_Mercado_Figuritas]
GO
ALTER TABLE [dbo].[Mercado]  WITH CHECK ADD  CONSTRAINT [FK_Mercado_Inventario] FOREIGN KEY([IdInventario])
REFERENCES [dbo].[Inventario] ([IdInventario])
GO
ALTER TABLE [dbo].[Mercado] CHECK CONSTRAINT [FK_Mercado_Inventario]
GO
ALTER TABLE [dbo].[Mercado]  WITH CHECK ADD  CONSTRAINT [FK_Mercado_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Mercado] CHECK CONSTRAINT [FK_Mercado_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[AbrirSobreNormal]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AbrirSobreNormal]
	@user int
as
begin
	create table #TempResults (
        IdFigurita INT,
		Nombre varchar(50),
		ImagenJugador varchar(500),
		Tipo varchar(50),
		Precio int,
		Numero [int],
		IdEquipo int,
		Apellido varchar(50)
    );

    insert into #TempResults
    exec ConseguirFigurita @user;

    insert into #TempResults
    exec ConseguirFigurita @user;

    insert into #TempResults
    exec ConseguirFigurita @user;

    select * from #TempResults;

    drop table #TempResults;

end

SELECT * From Usuario Where IdUsuario = 4
GO
/****** Object:  StoredProcedure [dbo].[AbrirSobrePremium]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[AbrirSobrePremium]
	@user int
as
begin
	create table #TempResults (
        IdFigurita INT,
		Nombre varchar(50),
		ImagenJugador varchar(500),
		Tipo varchar(50),
		Precio int,
		Numero [int],
		IdEquipo int,
		Apellido varchar(50)
    );

    insert into #TempResults
    exec ConseguirFigurita @user;

    insert into #TempResults
    exec ConseguirFigurita @user;

    insert into #TempResults
    exec ConseguirFigurita @user;

	insert into #TempResults
    exec ConseguirFigurita @user;

    insert into #TempResults
    exec ConseguirFigurita @user;

    select * from #TempResults;

    drop table #TempResults;

end
GO
/****** Object:  StoredProcedure [dbo].[ComprarSobres]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ComprarSobres]
@precio int,@idUsuario int
AS
BEGIN
Update Usuario set Monedas-=@precio WHERE IdUsuario=@idUsuario
END

GO
/****** Object:  StoredProcedure [dbo].[ConseguirFigurita]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[ConseguirFigurita]
	@user int
as
begin
	declare @numRand int = (SELECT ROUND(((37 - 0) * RAND() + 0), 0))

	select * from Figuritas where Numero = @numRand

	insert into InventarioXFigus(IdInventario, IdFigurita) Values((select IdInventario from Inventario where IdUsuario = @user), (select IdFigurita from Figuritas where Numero = @numRand))
end

GO
/****** Object:  StoredProcedure [dbo].[GetUsuario]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetUsuario]
@usuario varchar(50)
as
begin

select * from Usuario where Nombre=@usuario;


end
GO
/****** Object:  StoredProcedure [dbo].[GetUsuarioById]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetUsuarioById]
	@user int
as
begin
	select * from Usuario where IdUsuario = @user
end
GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
@NombreUsuario varchar(50),
@Contraseña varchar(500)
AS
BEGIN
declare @contraseñacorrecta varchar(100) /*declaro lo que necesito para comparar*/

SELECT @contraseñacorrecta = Contraseña from Usuario where Nombre=@NombreUsuario COLLATE Latin1_General_BIN  /*le doy un valor*/

if (@Contraseña COLLATE Latin1_General_BIN =@contraseñacorrecta) /*la comparo con el parametro ingresado*/
begin
print 'true'
SELECT 1 /*true*/
end

ELSE 
begin 
print 'False'
SELECT 0/*false*/
end

END;
GO
/****** Object:  StoredProcedure [dbo].[obtenerFiguritas]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerFiguritas]
AS
BEGIN
SELECT * FROM Figuritas 

end
GO
/****** Object:  StoredProcedure [dbo].[obtenerInventario]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerInventario]
    @user int
AS
BEGIN
    SELECT DISTINCT F.IdFigurita, F.Nombre, F.ImagenJugador, F.Tipo, F.Precio, F.Numero, F.IdEquipo, F.Apellido
    FROM Figuritas F
    INNER JOIN InventarioXFigus ixf ON ixf.IdFigurita = F.IdFigurita
    INNER JOIN Inventario I ON I.IdInventario = ixf.IdInventario
    INNER JOIN Usuario U ON U.IdUsuario = I.IdUsuario
    WHERE U.IdUsuario = @user
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerInventarioxPaises]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerInventarioxPaises]
    @user int,
	@equipo int
AS 
BEGIN

    SELECT DISTINCT F.IdFigurita, F.Nombre, F.ImagenJugador, F.Tipo, F.Precio, F.Numero, F.IdEquipo, F.Apellido
    FROM Figuritas F
    INNER JOIN InventarioXFigus ixf ON ixf.IdFigurita = F.IdFigurita
    INNER JOIN Inventario I ON I.IdInventario = ixf.IdInventario
    INNER JOIN Usuario U ON U.IdUsuario = I.IdUsuario
    WHERE U.IdUsuario = @user and F.idEquipo = @equipo

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerSobres]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerSobres]
AS
BEGIN
SELECT * FROM Sobres
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarseUsuario]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarseUsuario]
    @NombreUsuario VARCHAR(50),
    @Contraseña VARCHAR(500),
    @ConfirmarContra VARCHAR(100),
    @Email VARCHAR(100)
AS
BEGIN

DECLARE @IDusuario int

    IF EXISTS (SELECT * FROM Usuario WHERE Nombre = @NombreUsuario )
    BEGIN
        SELECT -1 /* El nombre de usuario ya está en uso */
        RETURN
    END

    IF LEN(@Contraseña) < 8 
    BEGIN
        SELECT -2 /* No cumple con las condiciones de seguridad de la contraseña */
		print 8
        RETURN
    END

    IF @Contraseña COLLATE Latin1_General_BIN NOT LIKE N'%[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]%'
    BEGIN
        SELECT -2 /* No cumple con las condiciones de seguridad de la contraseña */
		print 'A-Z'
        RETURN
    END

	
    IF @Contraseña COLLATE Latin1_General_BIN NOT LIKE N'%[^a-zA-Z0-9]%'
    BEGIN
        SELECT -2 /* No cumple con las condiciones de seguridad de la contraseña */
		print 'ESPECIALES'
        RETURN
    END


    IF @Contraseña = @NombreUsuario OR @Contraseña = @Email
    BEGIN
        SELECT -3 /* Contraseña igual al nombre de usuario o email */
        RETURN
    END

    IF @Contraseña COLLATE Latin1_General_BIN != @ConfirmarContra COLLATE Latin1_General_BIN
    BEGIN
        SELECT -4 /* Confirmación de contraseña fallida */
        RETURN
    END

    IF @NombreUsuario IN ('Hitler', 'Cristina_Kirchner', 'Sexo')
    BEGIN
        SELECT -5 /* Nombre de usuario no permitido */
        RETURN
    END

	 IF EXISTS (SELECT * FROM Usuario WHERE Email = @Email)
    BEGIN
        SELECT -6 /* El email ya está en uso */
        RETURN
    END

    INSERT INTO Usuario (Nombre, Contraseña, Email, Monedas)
    VALUES (@NombreUsuario, @Contraseña, @Email, 50)

	SELECT @IDusuario = IdUsuario from Usuario WHERE Nombre = @NombreUsuario COLLATE Latin1_General_BIN and Contraseña = @Contraseña COLLATE Latin1_General_BIN
	INSERT INTO Inventario(IdUsuario) VALUES(@IDusuario)
    SELECT 0 /* Registro exitoso */
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CambiarContraseña]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CambiarContraseña]
    @usuario VARCHAR(50),
    @contraseña VARCHAR(50),
    @nuevaContraseña VARCHAR(50),
	@ConfirmarContra VARCHAR(50)

AS
BEGIN
    DECLARE @contraseñaActual VARCHAR(50)
	declare @contraseñacorrecta varchar(100) /*declaro lo que necesito para comparar*/

	/*validar*/
	
	 IF NOT EXISTS (SELECT * FROM Usuario WHERE Nombre = @usuario COLLATE Latin1_General_BIN)
    BEGIN
        SELECT -3 /* El nombre de usuario no existe*/
        RETURN
    END

    SELECT @contraseñacorrecta = Contraseña from Usuario where Nombre=@usuario COLLATE Latin1_General_BIN  /*le doy un valor*/
	if (@contraseña COLLATE Latin1_General_BIN !=@contraseñacorrecta COLLATE Latin1_General_BIN) /*la comparo con el parametro ingresado*/
	BEGIN 
	  SELECT -3
	  RETURN
	END

	/*seguridad*/

	IF LEN(@nuevaContraseña) < 8 
    BEGIN
        SELECT -1 /* No cumple con las condiciones de seguridad de la contraseña */
		print 8
        RETURN
    END

    IF @nuevaContraseña COLLATE Latin1_General_BIN NOT LIKE N'%[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]%'
    BEGIN
        SELECT -1 /* No cumple con las condiciones de seguridad de la contraseña */
		print 'A-Z'
        RETURN
    END

	
    IF @nuevaContraseña COLLATE Latin1_General_BIN NOT LIKE N'%[^a-zA-Z0-9]%'
    BEGIN
        SELECT -1 /* No cumple con las condiciones de seguridad de la contraseña */
		print 'ESPECIALES'
        RETURN
    END
	

	/*igual a la anterior*/

    SELECT @contraseñaActual = Contraseña FROM Usuario WHERE Nombre = @usuario

    IF @nuevaContraseña = @usuario OR @nuevaContraseña = @contraseñaActual
    BEGIN
        SELECT -2 /* La nueva contraseña es igual al usuario o a la contraseña actual */
        RETURN
    END


	 /*confirmacion*/

	  IF @nuevaContraseña COLLATE Latin1_General_BIN != @ConfirmarContra COLLATE Latin1_General_BIN
    BEGIN
        SELECT -4 /* Confirmación de contraseña fallida */
        RETURN
    END

	/*exito*/

    UPDATE Usuario SET Contraseña = @nuevaContraseña WHERE Nombre = @usuario
    SELECT 0 /* Cambio exitoso */
END;

GO
/****** Object:  StoredProcedure [dbo].[SP_Repetidas]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Repetidas]
@user int
AS
BEGIN
SELECT F.IdFigurita, F.Nombre, F.ImagenJugador, F.Tipo, F.Precio, F.Numero, F.IdEquipo, F.Apellido 
FROM Figuritas F
INNER JOIN InventarioXFigus ixf ON ixf.IdFigurita = F.IdFigurita
INNER JOIN Inventario I ON I.IdInventario = ixf.IdInventario
INNER JOIN Usuario U ON U.IdUsuario = I.IdUsuario
WHERE U.IdUsuario = @user
GROUP BY F.IdFigurita, F.Nombre, F.ImagenJugador, F.Tipo, F.Precio, F.Numero, F.IdEquipo, F.Apellido 
HAVING COUNT(ixf.IdInventario) > 1
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SepararFiguritasPorEquipo]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SepararFiguritasPorEquipo]
@equipo int
AS
BEGIN
SELECT * FROM Figuritas WHERE IdEquipo = @equipo
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Vender]    Script Date: 22/4/2024 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Vender] 
@precio int,@idUsuario int, @idFigu int
AS
Begin

begin
Update Usuario set Monedas+=@precio WHERE IdUsuario=@idUsuario
end

DELETE TOP(1) FROM InventarioXFigus WHERE IdFigurita=@idFigu
end
GO
USE [master]
GO
ALTER DATABASE [BDAlbum] SET  READ_WRITE 
GO
