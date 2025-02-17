USE [master]
GO
/****** Base de datos de estudiante creada por******/
/****** Angel reyes          809-123-4567 ******/
CREATE DATABASE [SistemaGestionCompras]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaGestionCompras', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SistemaGestionCompras.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaGestionCompras_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SistemaGestionCompras_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SistemaGestionCompras] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaGestionCompras].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaGestionCompras] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaGestionCompras] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaGestionCompras] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemaGestionCompras] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaGestionCompras] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemaGestionCompras] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaGestionCompras] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaGestionCompras] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaGestionCompras] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaGestionCompras] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaGestionCompras] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaGestionCompras] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemaGestionCompras', N'ON'
GO
ALTER DATABASE [SistemaGestionCompras] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaGestionCompras] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SistemaGestionCompras]
GO
/****** Object:  Table [dbo].[DetallesOrden]    Script Date: 14/8/2024 2:30:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesOrden](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[OrdenID] [int] NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesCompra]    Script Date: 14/8/2024 2:30:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesCompra](
	[OrdenID] [int] IDENTITY(1,1) NOT NULL,
	[ProveedorID] [int] NULL,
	[FechaOrden] [date] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrdenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 14/8/2024 2:30:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[PagoID] [int] IDENTITY(1,1) NOT NULL,
	[OrdenID] [int] NULL,
	[FechaPago] [date] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[MetodoPago] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 14/8/2024 2:30:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](200) NULL,
	[Precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 14/8/2024 2:30:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetallesOrden] ON 

INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (1, 1, 1, 2, CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (2, 2, 2, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (3, 3, 3, 3, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (4, 4, 4, 1, CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (5, 5, 5, 2, CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (6, 6, 6, 3, CAST(130.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (7, 7, 7, 4, CAST(140.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (8, 8, 8, 5, CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (9, 9, 9, 6, CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([DetalleID], [OrdenID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (10, 10, 10, 7, CAST(170.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetallesOrden] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenesCompra] ON 

INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (1, 1, CAST(N'2024-08-01' AS Date), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (2, 2, CAST(N'2024-08-02' AS Date), CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (3, 3, CAST(N'2024-08-03' AS Date), CAST(450.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (4, 4, CAST(N'2024-08-04' AS Date), CAST(320.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (5, 5, CAST(N'2024-08-05' AS Date), CAST(480.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (6, 6, CAST(N'2024-08-06' AS Date), CAST(360.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (7, 7, CAST(N'2024-08-07' AS Date), CAST(430.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (8, 8, CAST(N'2024-08-08' AS Date), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (9, 9, CAST(N'2024-08-09' AS Date), CAST(370.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdenesCompra] ([OrdenID], [ProveedorID], [FechaOrden], [Total]) VALUES (10, 10, CAST(N'2024-08-10' AS Date), CAST(390.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrdenesCompra] OFF
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 

INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (1, 1, CAST(N'2024-08-04' AS Date), CAST(300.00 AS Decimal(10, 2)), N'Tarjeta de Crédito')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (2, 2, CAST(N'2024-08-05' AS Date), CAST(400.00 AS Decimal(10, 2)), N'Transferencia Bancaria')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (3, 3, CAST(N'2024-08-06' AS Date), CAST(450.00 AS Decimal(10, 2)), N'Efectivo')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (4, 4, CAST(N'2024-08-07' AS Date), CAST(320.00 AS Decimal(10, 2)), N'Tarjeta de Crédito')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (5, 5, CAST(N'2024-08-08' AS Date), CAST(480.00 AS Decimal(10, 2)), N'Transferencia Bancaria')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (6, 6, CAST(N'2024-08-09' AS Date), CAST(360.00 AS Decimal(10, 2)), N'Efectivo')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (7, 7, CAST(N'2024-08-10' AS Date), CAST(430.00 AS Decimal(10, 2)), N'Tarjeta de Crédito')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (8, 8, CAST(N'2024-08-11' AS Date), CAST(500.00 AS Decimal(10, 2)), N'Transferencia Bancaria')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (9, 9, CAST(N'2024-08-12' AS Date), CAST(370.00 AS Decimal(10, 2)), N'Efectivo')
INSERT [dbo].[Pagos] ([PagoID], [OrdenID], [FechaPago], [Monto], [MetodoPago]) VALUES (10, 10, CAST(N'2024-08-13' AS Date), CAST(390.00 AS Decimal(10, 2)), N'Tarjeta de Crédito')
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (1, N'Producto 1', N'Descripción del Producto 1', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (2, N'Producto 2', N'Descripción del Producto 2', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (3, N'Producto 3', N'Descripción del Producto 3', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (4, N'Producto 4', N'Descripción del Producto 4', CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (5, N'Producto 5', N'Descripción del Producto 5', CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (6, N'Producto 6', N'Descripción del Producto 6', CAST(130.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (7, N'Producto 7', N'Descripción del Producto 7', CAST(140.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (8, N'Producto 8', N'Descripción del Producto 8', CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (9, N'Producto 9', N'Descripción del Producto 9', CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio]) VALUES (10, N'Producto 10', N'Descripción del Producto 10', CAST(170.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (1, N'Proveedor A', N'Calle 123', N'809-123-4567', N'proveedora@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (2, N'Proveedor B', N'Avenida 456', N'809-234-5678', N'proveedorb@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (3, N'Proveedor C', N'Boulevard 789', N'809-345-6789', N'proveedorc@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (4, N'Proveedor D', N'Calle 987', N'809-567-8901', N'proveedord@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (5, N'Proveedor E', N'Avenida 654', N'809-678-9012', N'proveedore@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (6, N'Proveedor F', N'Boulevard 321', N'809-789-0123', N'proveedorf@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (7, N'Proveedor G', N'Calle 246', N'809-890-1234', N'proveedorg@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (8, N'Proveedor H', N'Avenida 135', N'809-901-2345', N'proveedorh@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (9, N'Proveedor I', N'Boulevard 864', N'809-012-3456', N'proveedori@example.com')
INSERT [dbo].[Proveedores] ([ProveedorID], [Nombre], [Direccion], [Telefono], [Email]) VALUES (10, N'Proveedor J', N'Calle 753', N'809-123-4567', N'proveedorj@example.com')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Proveedo__A9D10534C8B84A77]    Script Date: 14/8/2024 2:30:59 a. m. ******/
ALTER TABLE [dbo].[Proveedores] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrdenesCompra] ADD  DEFAULT (getdate()) FOR [FechaOrden]
GO
ALTER TABLE [dbo].[DetallesOrden]  WITH CHECK ADD FOREIGN KEY([OrdenID])
REFERENCES [dbo].[OrdenesCompra] ([OrdenID])
GO
ALTER TABLE [dbo].[DetallesOrden]  WITH CHECK ADD FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[OrdenesCompra]  WITH CHECK ADD FOREIGN KEY([ProveedorID])
REFERENCES [dbo].[Proveedores] ([ProveedorID])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([OrdenID])
REFERENCES [dbo].[OrdenesCompra] ([OrdenID])
GO
USE [master]
GO
ALTER DATABASE [SistemaGestionCompras] SET  READ_WRITE 
GO
