USE [master]
GO
/****** Object:  Database [ClinicaSanPatras]    Script Date: 12/11/2023 21:44:56 ******/
CREATE DATABASE [ClinicaSanPatras]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicaSanPatras', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClinicaSanPatras.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClinicaSanPatras_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClinicaSanPatras_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ClinicaSanPatras] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicaSanPatras].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicaSanPatras] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicaSanPatras] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicaSanPatras] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClinicaSanPatras] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicaSanPatras] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicaSanPatras] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicaSanPatras] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicaSanPatras] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicaSanPatras] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicaSanPatras] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClinicaSanPatras] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClinicaSanPatras] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClinicaSanPatras] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClinicaSanPatras] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClinicaSanPatras]
GO
/****** Object:  Table [dbo].[Cama]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cama](
	[codigo_cama] [int] NOT NULL,
	[nombre] [nvarchar](10) NOT NULL,
	[Descripcion] [nvarchar](300) NOT NULL,
	[estado_cama] [bit] NOT NULL,
	[codigo_habitacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_cama] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[codigo_depa] [int] NOT NULL,
	[nombre_depa] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_depa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_enfermedades]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_enfermedades](
	[codigo_detalle] [int] NOT NULL,
	[diagnostico] [nvarchar](300) NOT NULL,
	[tratamiento] [nvarchar](300) NOT NULL,
	[codigo_enfermedad] [int] NOT NULL,
	[codigo_ingreso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfermedad](
	[codigo_enfermedad] [int] NOT NULL,
	[nombre_enfermedad] [nvarchar](100) NOT NULL,
	[descripcion_tratamiento] [nvarchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_enfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[codigo_especialidad] [int] NOT NULL,
	[nombre_especialidad] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[codigo_habitacion] [int] NOT NULL,
	[nombre_habitacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Habitaci__2EFB149664460318] PRIMARY KEY CLUSTERED 
(
	[codigo_habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[codigo_ingreso] [int] NOT NULL,
	[fecha_ingreso] [smalldatetime] NOT NULL,
	[fecha_egreso] [smalldatetime] NULL,
	[codigo_cama] [int] NOT NULL,
	[codigo_paciente] [int] NOT NULL,
	[codigo_medico] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[codigo_medico] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellidos] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](300) NOT NULL,
	[telefono] [nvarchar](12) NOT NULL,
	[codigo_especialidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[codigo_muni] [int] NOT NULL,
	[nombre_muni] [nvarchar](100) NOT NULL,
	[codigo_depa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_muni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 12/11/2023 21:44:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[codigo_paciente] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](300) NOT NULL,
	[telefono] [nvarchar](12) NOT NULL,
	[fechanac] [smalldatetime] NOT NULL,
	[codigo_muni] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cama] ([codigo_cama], [nombre], [Descripcion], [estado_cama], [codigo_habitacion]) VALUES (1, N'Cama 1', N'Omega', 0, 1)
INSERT [dbo].[Cama] ([codigo_cama], [nombre], [Descripcion], [estado_cama], [codigo_habitacion]) VALUES (2, N'Cama 2', N'Alpha', 1, 1)
INSERT [dbo].[Cama] ([codigo_cama], [nombre], [Descripcion], [estado_cama], [codigo_habitacion]) VALUES (3, N'Cama 1', N'Alpha', 0, 3)
INSERT [dbo].[Cama] ([codigo_cama], [nombre], [Descripcion], [estado_cama], [codigo_habitacion]) VALUES (4, N'Cama 1', N'Omega', 0, 2)
INSERT [dbo].[Cama] ([codigo_cama], [nombre], [Descripcion], [estado_cama], [codigo_habitacion]) VALUES (5, N'Cama 2', N'Alpha', 0, 2)
GO
INSERT [dbo].[Departamento] ([codigo_depa], [nombre_depa]) VALUES (1, N'Guatemala')
INSERT [dbo].[Departamento] ([codigo_depa], [nombre_depa]) VALUES (2, N'Quetzaltenango')
INSERT [dbo].[Departamento] ([codigo_depa], [nombre_depa]) VALUES (3, N'Totonicapan')
INSERT [dbo].[Departamento] ([codigo_depa], [nombre_depa]) VALUES (4, N'San Marcos')
GO
INSERT [dbo].[detalle_enfermedades] ([codigo_detalle], [diagnostico], [tratamiento], [codigo_enfermedad], [codigo_ingreso]) VALUES (1, N'Infeccion Urinaria Leve', N'Ingesta de Mas LIquidos y Disminucion de Bebidas Irritantes', 1, 1)
INSERT [dbo].[detalle_enfermedades] ([codigo_detalle], [diagnostico], [tratamiento], [codigo_enfermedad], [codigo_ingreso]) VALUES (2, N'Acne Leve', N'Limpieza Facial Regular con Productos para Piel Seca', 2, 3)
GO
INSERT [dbo].[Enfermedad] ([codigo_enfermedad], [nombre_enfermedad], [descripcion_tratamiento]) VALUES (1, N'Infeccion urinaria', N'Antibiotico, Ingesta de mas Liquidos y disminucion de cafeina e alcohol')
INSERT [dbo].[Enfermedad] ([codigo_enfermedad], [nombre_enfermedad], [descripcion_tratamiento]) VALUES (2, N'Acne', N'Limpieza facial regular, productos tópicos con peróxido de benzoilo o ácido salicílico')
INSERT [dbo].[Enfermedad] ([codigo_enfermedad], [nombre_enfermedad], [descripcion_tratamiento]) VALUES (3, N'Resfriado Comun', N'Descanso, Antibioticos si este se complica, Consumo de Bebidas Calientes')
GO
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (1, N'Medico General')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (2, N'Pediatra')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (3, N'Cirujano General')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (4, N'Dermatologo')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (5, N'Cirujano Pediatrico')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (6, N'NeuroCirujano')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (7, N'Anestesiologo')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (8, N'Cirujano Plastico')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (9, N'Ginecología')
INSERT [dbo].[Especialidad] ([codigo_especialidad], [nombre_especialidad]) VALUES (10, N'Nefrologo')
GO
INSERT [dbo].[Habitacion] ([codigo_habitacion], [nombre_habitacion]) VALUES (1, N'Hab1')
INSERT [dbo].[Habitacion] ([codigo_habitacion], [nombre_habitacion]) VALUES (2, N'Hab2')
INSERT [dbo].[Habitacion] ([codigo_habitacion], [nombre_habitacion]) VALUES (3, N'Hab3')
INSERT [dbo].[Habitacion] ([codigo_habitacion], [nombre_habitacion]) VALUES (4, N'Hab4')
INSERT [dbo].[Habitacion] ([codigo_habitacion], [nombre_habitacion]) VALUES (5, N'Hab5')
INSERT [dbo].[Habitacion] ([codigo_habitacion], [nombre_habitacion]) VALUES (6, N'Hab6')
GO
INSERT [dbo].[Ingreso] ([codigo_ingreso], [fecha_ingreso], [fecha_egreso], [codigo_cama], [codigo_paciente], [codigo_medico]) VALUES (1, CAST(N'2023-10-19T00:00:00' AS SmallDateTime), CAST(N'2023-10-20T00:00:00' AS SmallDateTime), 2, 3, 1)
INSERT [dbo].[Ingreso] ([codigo_ingreso], [fecha_ingreso], [fecha_egreso], [codigo_cama], [codigo_paciente], [codigo_medico]) VALUES (2, CAST(N'2023-10-19T00:00:00' AS SmallDateTime), CAST(N'2023-10-20T00:00:00' AS SmallDateTime), 1, 3, 4)
INSERT [dbo].[Ingreso] ([codigo_ingreso], [fecha_ingreso], [fecha_egreso], [codigo_cama], [codigo_paciente], [codigo_medico]) VALUES (3, CAST(N'2023-10-20T00:00:00' AS SmallDateTime), CAST(N'2023-10-20T00:00:00' AS SmallDateTime), 5, 4, 4)
GO
INSERT [dbo].[Medico] ([codigo_medico], [nombre], [apellidos], [direccion], [telefono], [codigo_especialidad]) VALUES (1, N'Josh Daniel', N'Ramon Gomez', N'10-41 Zona 4', N'12345678', 1)
INSERT [dbo].[Medico] ([codigo_medico], [nombre], [apellidos], [direccion], [telefono], [codigo_especialidad]) VALUES (2, N'Juan Daniel', N'Gomez Gomez', N'15 - 48 Zona 4', N'87542196', 2)
INSERT [dbo].[Medico] ([codigo_medico], [nombre], [apellidos], [direccion], [telefono], [codigo_especialidad]) VALUES (3, N'Jose Jose', N'Godinez Lopez', N'10- 35 Zona 9', N'96325874', 3)
INSERT [dbo].[Medico] ([codigo_medico], [nombre], [apellidos], [direccion], [telefono], [codigo_especialidad]) VALUES (4, N'Lua Jose', N'Armando House', N'10- 35 Zona 4', N'87542196', 4)
INSERT [dbo].[Medico] ([codigo_medico], [nombre], [apellidos], [direccion], [telefono], [codigo_especialidad]) VALUES (5, N'Jose Fernando', N'Castillo Lopez', N'9-07 Zona 1', N'96325814', 8)
INSERT [dbo].[Medico] ([codigo_medico], [nombre], [apellidos], [direccion], [telefono], [codigo_especialidad]) VALUES (6, N'Alex Xela', N'Lopez Sanchez', N'9-35 Zona 6', N'32569874', 3)
INSERT [dbo].[Medico] ([codigo_medico], [nombre], [apellidos], [direccion], [telefono], [codigo_especialidad]) VALUES (7, N'Oscar Jose', N'Soto Lopez', N'10-09 Zona 2', N'87549632', 2)
GO
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (1, N'Guatemala', 1)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (2, N'Santa Catarina Pinula', 1)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (3, N'San José Pinula', 1)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (4, N'San José del Golfo', 1)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (5, N'Palencia', 1)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (6, N'Quetzaltenango', 2)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (7, N'Almolonga', 2)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (8, N'Cantel', 2)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (9, N'La Esperanza', 2)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (10, N'Coatepeque', 2)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (11, N'Olintepeque', 2)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (12, N'Salcaja', 2)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (13, N'San Cristobál Totonicapán', 3)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (14, N'San Francisco el Alto', 3)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (15, N'Totonicapán', 3)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (16, N'Sibinal', 4)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (17, N'Sipacapa', 4)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (18, N'Tacaná', 4)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (19, N'Tajumulco', 4)
INSERT [dbo].[Municipio] ([codigo_muni], [nombre_muni], [codigo_depa]) VALUES (20, N'Tejutla', 4)
GO
INSERT [dbo].[Paciente] ([codigo_paciente], [nombre], [apellido], [direccion], [telefono], [fechanac], [codigo_muni]) VALUES (1, N'Josue Daniel', N'Gomez Saj', N'10-85 Zona 2', N'12365498', CAST(N'1999-02-19T00:00:00' AS SmallDateTime), 3)
INSERT [dbo].[Paciente] ([codigo_paciente], [nombre], [apellido], [direccion], [telefono], [fechanac], [codigo_muni]) VALUES (2, N'Juan Jose', N'Lopez Lopez', N'8 - 11 Zona 3', N'32145698', CAST(N'2001-03-09T00:00:00' AS SmallDateTime), 7)
INSERT [dbo].[Paciente] ([codigo_paciente], [nombre], [apellido], [direccion], [telefono], [fechanac], [codigo_muni]) VALUES (3, N'Juan Felix', N'Lopez Doriga', N'8-19 Zona 3', N'85236941', CAST(N'1998-05-09T00:00:00' AS SmallDateTime), 14)
INSERT [dbo].[Paciente] ([codigo_paciente], [nombre], [apellido], [direccion], [telefono], [fechanac], [codigo_muni]) VALUES (4, N'Luis Fernando', N'Castillo Torres', N'2-09 Zona 4', N'96387458', CAST(N'2001-09-15T00:00:00' AS SmallDateTime), 9)
GO
ALTER TABLE [dbo].[Cama]  WITH CHECK ADD  CONSTRAINT [FK__Cama__codigo_hab__4E88ABD4] FOREIGN KEY([codigo_habitacion])
REFERENCES [dbo].[Habitacion] ([codigo_habitacion])
GO
ALTER TABLE [dbo].[Cama] CHECK CONSTRAINT [FK__Cama__codigo_hab__4E88ABD4]
GO
ALTER TABLE [dbo].[detalle_enfermedades]  WITH CHECK ADD FOREIGN KEY([codigo_ingreso])
REFERENCES [dbo].[Ingreso] ([codigo_ingreso])
GO
ALTER TABLE [dbo].[detalle_enfermedades]  WITH CHECK ADD FOREIGN KEY([codigo_enfermedad])
REFERENCES [dbo].[Enfermedad] ([codigo_enfermedad])
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD FOREIGN KEY([codigo_paciente])
REFERENCES [dbo].[Paciente] ([codigo_paciente])
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD FOREIGN KEY([codigo_medico])
REFERENCES [dbo].[Medico] ([codigo_medico])
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD FOREIGN KEY([codigo_cama])
REFERENCES [dbo].[Cama] ([codigo_cama])
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD FOREIGN KEY([codigo_especialidad])
REFERENCES [dbo].[Especialidad] ([codigo_especialidad])
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD FOREIGN KEY([codigo_depa])
REFERENCES [dbo].[Departamento] ([codigo_depa])
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD FOREIGN KEY([codigo_muni])
REFERENCES [dbo].[Municipio] ([codigo_muni])
GO
USE [master]
GO
ALTER DATABASE [ClinicaSanPatras] SET  READ_WRITE 
GO
