USE [master]
GO
/****** Object:  Database [dbs_suscripcion]    Script Date: 17/06/2023 8:47:03 a. m. ******/
CREATE DATABASE [dbs_suscripcion] ON  PRIMARY 
( NAME = N'dbs_suscripcion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\dbs_suscripcion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbs_suscripcion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\dbs_suscripcion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbs_suscripcion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbs_suscripcion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbs_suscripcion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbs_suscripcion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbs_suscripcion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbs_suscripcion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbs_suscripcion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbs_suscripcion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbs_suscripcion] SET  MULTI_USER 
GO
ALTER DATABASE [dbs_suscripcion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbs_suscripcion] SET DB_CHAINING OFF 
GO
USE [dbs_suscripcion]
GO
/****** Object:  Table [dbo].[tbl_clientes]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_clientes](
	[PKId] [varchar](10) NOT NULL,
	[Nombres] [varchar](60) NOT NULL,
	[Apellidos] [varchar](60) NOT NULL,
	[Contacto] [varchar](10) NOT NULL,
	[Direccion] [varchar](80) NOT NULL,
	[Correo] [varchar](80) NOT NULL,
	[FKCodigo_tbl_sexo] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estado]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estado](
	[PKCodigo] [char](1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Nomenclatura] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_paquetes]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_paquetes](
	[PKCodigo] [varchar](5) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Nomenclatura] [varchar](5) NOT NULL,
	[Valor] [float] NOT NULL,
	[FKCodigo_tbl_estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sexo]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sexo](
	[PKCodigo] [char](1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Nomenclatura] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_suscripciones]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_suscripciones](
	[PKN_Registro] [bigint] IDENTITY(1,1) NOT NULL,
	[FKId_tbl_clientes] [varchar](10) NOT NULL,
	[Fecha_registro] [date] NOT NULL,
	[Fecha_termina] [date] NOT NULL,
	[FKCodigo_tbl_paquetes] [varchar](5) NOT NULL,
	[FKCodigo_tbl_estado] [char](1) NOT NULL,
	[Valor_Actual] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKN_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_clientes] ([PKId], [Nombres], [Apellidos], [Contacto], [Direccion], [Correo], [FKCodigo_tbl_sexo]) VALUES (N'1', N'1', N'1', N'1', N'1', N'1', N'1')
INSERT [dbo].[tbl_clientes] ([PKId], [Nombres], [Apellidos], [Contacto], [Direccion], [Correo], [FKCodigo_tbl_sexo]) VALUES (N'1048269056', N'Moises', N'Altahona', N'3024215017', N'Malambo', N'mdaltahona6@misena.edu.co', N'1')
INSERT [dbo].[tbl_clientes] ([PKId], [Nombres], [Apellidos], [Contacto], [Direccion], [Correo], [FKCodigo_tbl_sexo]) VALUES (N'123', N'Dulfran', N'Montaño', N'3004640398', N'Sabanagrande', N'dulfranelinge@gmail.com', N'1')
INSERT [dbo].[tbl_clientes] ([PKId], [Nombres], [Apellidos], [Contacto], [Direccion], [Correo], [FKCodigo_tbl_sexo]) VALUES (N'2', N'2', N'2', N'2', N'2', N'2', N'2')
INSERT [dbo].[tbl_clientes] ([PKId], [Nombres], [Apellidos], [Contacto], [Direccion], [Correo], [FKCodigo_tbl_sexo]) VALUES (N'55', N'55', N'55', N'55', N'55', N'55', N'1')
INSERT [dbo].[tbl_clientes] ([PKId], [Nombres], [Apellidos], [Contacto], [Direccion], [Correo], [FKCodigo_tbl_sexo]) VALUES (N'555', N'Briggitte', N'Ramos', N'3126954069', N'Malambo', N'briggitte@hotmail.com', N'1')
GO
INSERT [dbo].[tbl_estado] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'1', N'Activo', N'A')
INSERT [dbo].[tbl_estado] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'2', N'Inactivo', N'I')
GO
INSERT [dbo].[tbl_paquetes] ([PKCodigo], [Descripcion], [Nomenclatura], [Valor], [FKCodigo_tbl_estado]) VALUES (N'1', N'Sqlserver + python + c#', N'IDBS', 500000, N'1')
INSERT [dbo].[tbl_paquetes] ([PKCodigo], [Descripcion], [Nomenclatura], [Valor], [FKCodigo_tbl_estado]) VALUES (N'2', N'Java + Mysql + Sql', N'JMS', 450000, N'1')
INSERT [dbo].[tbl_paquetes] ([PKCodigo], [Descripcion], [Nomenclatura], [Valor], [FKCodigo_tbl_estado]) VALUES (N'3', N'Python + Mysql + Css + html', N'PMCH', 350000, N'1')
INSERT [dbo].[tbl_paquetes] ([PKCodigo], [Descripcion], [Nomenclatura], [Valor], [FKCodigo_tbl_estado]) VALUES (N'4', N'Sqlserver + DML + SQL + DDL', N'SDSD', 600000, N'2')
GO
INSERT [dbo].[tbl_sexo] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'1', N'Masculino', N'M')
INSERT [dbo].[tbl_sexo] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'2', N'Femenino', N'F')
INSERT [dbo].[tbl_sexo] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'3', N'Prefiero no decirlo', N'P')
GO
SET IDENTITY_INSERT [dbo].[tbl_suscripciones] ON 

INSERT [dbo].[tbl_suscripciones] ([PKN_Registro], [FKId_tbl_clientes], [Fecha_registro], [Fecha_termina], [FKCodigo_tbl_paquetes], [FKCodigo_tbl_estado], [Valor_Actual]) VALUES (1, N'1048269056', CAST(N'2023-06-17' AS Date), CAST(N'2023-09-15' AS Date), N'2', N'1', 450000)
INSERT [dbo].[tbl_suscripciones] ([PKN_Registro], [FKId_tbl_clientes], [Fecha_registro], [Fecha_termina], [FKCodigo_tbl_paquetes], [FKCodigo_tbl_estado], [Valor_Actual]) VALUES (2, N'1048269056', CAST(N'2023-06-17' AS Date), CAST(N'2023-09-15' AS Date), N'2', N'1', 450000)
SET IDENTITY_INSERT [dbo].[tbl_suscripciones] OFF
GO
ALTER TABLE [dbo].[tbl_clientes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_clientes_tbl_sexo] FOREIGN KEY([FKCodigo_tbl_sexo])
REFERENCES [dbo].[tbl_sexo] ([PKCodigo])
GO
ALTER TABLE [dbo].[tbl_clientes] CHECK CONSTRAINT [FK_tbl_clientes_tbl_sexo]
GO
ALTER TABLE [dbo].[tbl_paquetes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_paquetes_tbl_estado] FOREIGN KEY([FKCodigo_tbl_estado])
REFERENCES [dbo].[tbl_estado] ([PKCodigo])
GO
ALTER TABLE [dbo].[tbl_paquetes] CHECK CONSTRAINT [FK_tbl_paquetes_tbl_estado]
GO
ALTER TABLE [dbo].[tbl_suscripciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_suscripciones_tbl_clientes] FOREIGN KEY([FKId_tbl_clientes])
REFERENCES [dbo].[tbl_clientes] ([PKId])
GO
ALTER TABLE [dbo].[tbl_suscripciones] CHECK CONSTRAINT [FK_tbl_suscripciones_tbl_clientes]
GO
ALTER TABLE [dbo].[tbl_suscripciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_suscripciones_tbl_estado] FOREIGN KEY([FKCodigo_tbl_estado])
REFERENCES [dbo].[tbl_estado] ([PKCodigo])
GO
ALTER TABLE [dbo].[tbl_suscripciones] CHECK CONSTRAINT [FK_tbl_suscripciones_tbl_estado]
GO
ALTER TABLE [dbo].[tbl_suscripciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_suscripciones_tbl_paquetes] FOREIGN KEY([FKCodigo_tbl_paquetes])
REFERENCES [dbo].[tbl_paquetes] ([PKCodigo])
GO
ALTER TABLE [dbo].[tbl_suscripciones] CHECK CONSTRAINT [FK_tbl_suscripciones_tbl_paquetes]
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarPaquetes]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Dulfran>
-- Create date: <Create Date, 14 de junio del 2023>
-- Description:	<Description, Cargar paquetes>
-- =============================================
create procedure [dbo].[SP_CargarPaquetes]
as begin
	select PKCodigo,Descripcion from tbl_paquetes where FKCodigo_tbl_estado = 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarSexo]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dulfran>
-- Create date: <Create Date, 13 de junio del 2023>
-- Description:	<Description, Cargar Sexo>
-- =============================================
create procedure [dbo].[SP_CargarSexo]
as begin
	select PKCodigo, Nombre from tbl_sexo
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarSuscripciones]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Dulfran>
-- Create date: <Create Date, 14 de junio del 2023>
-- Description:	<Description, Cargar Suscripciones cliente>
-- =============================================
create procedure [dbo].[SP_CargarSuscripciones]
@id varchar(10)
as begin
	select 
	tbl_suscripciones.PKN_Registro as 'REGISTRO',
	tbl_paquetes.Descripcion as 'PAQUETE',
	tbl_suscripciones.Valor_Actual AS 'VALOR',
	tbl_suscripciones.Fecha_registro as 'FECHA INICIO',
	tbl_suscripciones.Fecha_termina as 'FECHA TERMINA',
	tbl_estado.Nomenclatura as 'ESTADO'
	from
	tbl_clientes,tbl_estado,tbl_suscripciones,tbl_paquetes
	where
	tbl_clientes.PKId = tbl_suscripciones.FKId_tbl_clientes and
	tbl_estado.PKCodigo = tbl_suscripciones.FKCodigo_tbl_estado and
	tbl_paquetes.PKCodigo = tbl_suscripciones.FKCodigo_tbl_paquetes and
	tbl_clientes.PKId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarCliente]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Dulfran>
-- Create date: <Create Date, 13 de junio del 2023>
-- Description:	<Description, Registrar cliente>
-- =============================================
create procedure [dbo].[SP_RegistrarCliente]
@id varchar(10),@nombres varchar(60),@apellidos varchar(60),@contacto varchar(10),@direccion varchar(80),@correo varchar(80),
@sexo char
as begin
	insert into tbl_clientes
	(PKId,Nombres,Apellidos,Contacto,Direccion,Correo,FKCodigo_tbl_sexo)
	values
	(@id,@nombres,@apellidos,@contacto,@direccion,@correo,@sexo)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarSuscripcion]    Script Date: 17/06/2023 8:47:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dulfran Montaño>
-- Create date: <Create Date, 17 de junio del 2023>
-- Description:	<Description, Registrar suscripcion>
-- =============================================
create procedure [dbo].[SP_RegistrarSuscripcion]
 @id_cliente varchar(10) , @cod_paquete varchar(5)
	as begin 
		 declare @FechaInicial date
		 declare @FechaFinal date
		 declare @Dias int 
		 set @FechaInicial = GETDATE()
		 set @Dias = 90
		 set @FechaFinal = (select DATEADD(DAY,@Dias,@FechaInicial))
		 declare @valorPaquete float
		 select @valorPaquete = (select Valor from tbl_paquetes where PKCodigo = @cod_paquete)
		 insert into tbl_suscripciones
		 (FKId_tbl_clientes , Fecha_Registro , Fecha_termina , FKCodigo_tbl_paquetes , FKCodigo_tbl_estado , Valor_Actual)
		 values
		 (@id_cliente , GETDATE(), @FechaFinal , @cod_paquete , '1' , @valorPaquete)
end
GO
USE [master]
GO
ALTER DATABASE [dbs_suscripcion] SET  READ_WRITE 
GO
