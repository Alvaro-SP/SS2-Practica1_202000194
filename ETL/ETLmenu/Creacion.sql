
USE [Practica1ETL]
GO
-- DROP SCHEMA dbo;

-- CREATE SCHEMA dbo;
-- practica1ETL.dbo.[Catalog] definition

-- Crear una tabla temporal para operaciones BULK
-- CREATE TABLE practica1ETL.dbo.TempDelivery (
--     EntregaID int NOT NULL,
-- 	Dia	varchar(50)  NULL,
-- 	Mes	varchar(50)  NULL,
-- 	Anio int  NULL,
-- 	NombreCliente varchar(50)  NULL,
-- 	Direccion varchar(50)  NULL,
-- 	NombreEmpleadoEntrega varchar(50)  NULL,
-- 	PuestoEmpleadoEntrega	varchar(50)  NULL,
-- 	CiudadEntrega	varchar(50)  NULL,
-- 	NombreProducto	varchar(50)  NULL,
-- 	Descripción	varchar(50)  NULL,
-- 	Peso	varchar(50)  NULL,
-- 	TiempoEntrega int  NULL,
-- 	EstadoEntrega	varchar(50)  NULL,
-- 	CostoEnvio	varchar(50)  NULL,
-- 	PrecioProducto real  NULL,
-- );

-- practica1ETL.dbo.[Catalog] definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.[Catalog];

CREATE TABLE practica1ETL.dbo.[Catalog] (
	id int IDENTITY(1,1) NOT NULL,
	EstadoEntrega varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Catalog PRIMARY KEY (id)
);


-- practica1ETL.dbo.City definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.City;

CREATE TABLE practica1ETL.dbo.City (
	id int IDENTITY(1,1) NOT NULL,
	ciudadEntrega varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_City PRIMARY KEY (id)
);


-- practica1ETL.dbo.Client definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.Client;

CREATE TABLE practica1ETL.dbo.Client (
	id int IDENTITY(1,1) NOT NULL,
	NombreCliente varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Direccion varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Client PRIMARY KEY (id)
);


-- practica1ETL.dbo.Employ definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.Employ;

CREATE TABLE practica1ETL.dbo.Employ (
	id int IDENTITY(1,1) NOT NULL,
	NombreEmpleadoEntrega varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PuestoEmpleadoEntrega varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Employ PRIMARY KEY (id)
);


-- practica1ETL.dbo.Product definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.Product;

CREATE TABLE practica1ETL.dbo.Product (
	id int IDENTITY(1,1) NOT NULL,
	NombreProducto varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Descripción varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Peso varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PrecioProducto real NULL,
	CONSTRAINT PK_Product PRIMARY KEY (id)
);


-- practica1ETL.dbo.TempDelivery definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.TempDelivery;

CREATE TABLE practica1ETL.dbo.TempDelivery (
	EntregaID int NOT NULL,
	Dia varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Mes varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Anio int NULL,
	NombreCliente varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Direccion varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	NombreEmpleadoEntrega varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PuestoEmpleadoEntrega varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CiudadEntrega varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	NombreProducto varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Descripción varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Peso varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TiempoEntrega int NULL,
	EstadoEntrega varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CostoEnvio varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PrecioProducto real NULL
);


-- practica1ETL.dbo.[Time] definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.[Time];

CREATE TABLE practica1ETL.dbo.[Time] (
	id int IDENTITY(1,1) NOT NULL,
	Dia varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Mes varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Anio int NULL,
	CONSTRAINT PK_Time PRIMARY KEY (id)
);


-- practica1ETL.dbo.sysdiagrams definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.sysdiagrams;

CREATE TABLE practica1ETL.dbo.sysdiagrams (
	name sysname COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	principal_id int NOT NULL,
	diagram_id int IDENTITY(1,1) NOT NULL,
	version int NULL,
	definition varbinary(MAX) NULL,
	CONSTRAINT PK__sysdiagr__C2B05B618CC2919D PRIMARY KEY (diagram_id),
	CONSTRAINT UK_principal_name UNIQUE (principal_id,name)
);


-- practica1ETL.dbo.Delivery definition

-- Drop table

-- DROP TABLE practica1ETL.dbo.Delivery;

CREATE TABLE practica1ETL.dbo.Delivery (
	EntregaID int NOT NULL,
	TimeID int NULL,
	ClientID int NULL,
	EmployID int NULL,
	CityID int NULL,
	ProductID int NULL,
	CatalogID int NULL,
	CostoEnvio real NULL,
	TiempoEntrega int NULL,
	CONSTRAINT PK_Delivery PRIMARY KEY (EntregaID),
	CONSTRAINT FK_Delivery_Catalog FOREIGN KEY (CatalogID) REFERENCES practica1ETL.dbo.[Catalog](id),
	CONSTRAINT FK_Delivery_City FOREIGN KEY (CityID) REFERENCES practica1ETL.dbo.City(id),
	CONSTRAINT FK_Delivery_Client FOREIGN KEY (ClientID) REFERENCES practica1ETL.dbo.Client(id),
	CONSTRAINT FK_Delivery_Employ FOREIGN KEY (EmployID) REFERENCES practica1ETL.dbo.Employ(id),
	CONSTRAINT FK_Delivery_Product FOREIGN KEY (ProductID) REFERENCES practica1ETL.dbo.Product(id),
	CONSTRAINT FK_Delivery_Time FOREIGN KEY (TimeID) REFERENCES practica1ETL.dbo.[Time](id)
);
