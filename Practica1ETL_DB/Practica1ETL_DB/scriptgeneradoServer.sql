USE [practica1ETL]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 8/18/2023 6:35:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[id] [real] NOT NULL,
	[EstadoEntrega] [varchar](50) NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 8/18/2023 6:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ciudadEntrega] [varchar](50) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 8/18/2023 6:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCliente] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 8/18/2023 6:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[EntregaID] [int] NOT NULL,
	[TimeID] [int] NULL,
	[ClientID] [int] NULL,
	[EmployID] [int] NULL,
	[CityID] [int] NULL,
	[ProductID] [int] NULL,
	[CatalogID] [int] NULL,
	[CostoEnvio] [real] NULL,
	[TiempoEntrega] [int] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[EntregaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employ]    Script Date: 8/18/2023 6:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpleadoEntrega] [varchar](50) NULL,
	[PuestoEmpleadoEntrega] [varchar](50) NULL,
 CONSTRAINT [PK_Employ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/18/2023 6:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](50) NULL,
	[Descripción] [varchar](50) NULL,
	[Peso] [varchar](50) NULL,
	[PrecioProducto] [real] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempDelivery]    Script Date: 8/18/2023 6:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempDelivery](
	[EntregaID] [int] NOT NULL,
	[Dia] [varchar](50) NULL,
	[Mes] [varchar](50) NULL,
	[Anio] [int] NULL,
	[NombreCliente] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[NombreEmpleadoEntrega] [varchar](50) NULL,
	[PuestoEmpleadoEntrega] [varchar](50) NULL,
	[CiudadEntrega] [varchar](50) NULL,
	[NombreProducto] [varchar](50) NULL,
	[Descripción] [varchar](50) NULL,
	[Peso] [varchar](50) NULL,
	[TiempoEntrega] [int] NULL,
	[EstadoEntrega] [varchar](50) NULL,
	[CostoEnvio] [varchar](50) NULL,
	[PrecioProducto] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 8/18/2023 6:35:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [varchar](50) NULL,
	[Mes] [varchar](50) NULL,
	[Anio] [int] NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Catalog] FOREIGN KEY([CostoEnvio])
REFERENCES [dbo].[Catalog] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Catalog]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_City]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Client]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Employ] FOREIGN KEY([EmployID])
REFERENCES [dbo].[Employ] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Employ]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Time] FOREIGN KEY([TimeID])
REFERENCES [dbo].[Time] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Time]
GO
