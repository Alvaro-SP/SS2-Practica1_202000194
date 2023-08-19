USE [practica1ETL]
GO
INSERT INTO Time (Dia, Mes, Anio)
(
    SELECT DISTINCT TempDelivery.Dia, TempDelivery.Mes, TempDelivery.Anio
    FROM TempDelivery
)
GO
INSERT INTO Client (NombreCliente, Direccion)
(
    SELECT DISTINCT TempDelivery.NombreCliente, TempDelivery.Direccion
    FROM TempDelivery
)

INSERT INTO Catalog (EstadoEntrega )
(
    SELECT DISTINCT TempDelivery.EstadoEntrega
    FROM TempDelivery
)
INSERT INTO City (ciudadEntrega)
(
    SELECT DISTINCT TempDelivery.ciudadEntrega
    FROM TempDelivery
)
INSERT INTO Employ (NombreEmpleadoEntrega, PuestoEmpleadoEntrega)
(
    SELECT DISTINCT TempDelivery.NombreEmpleadoEntrega, TempDelivery.PuestoEmpleadoEntrega
    FROM TempDelivery
)
INSERT INTO Product (NombreProducto, Descripcion, Peso, PrecioProducto)
(
    SELECT DISTINCT TempDelivery.NombreProducto, TempDelivery.Descripcion, TempDelivery.Peso, TempDelivery.PrecioProducto
    FROM TempDelivery
)
GO
INSERT INTO Delivery (EntregaID, TimeID, ClientID, EmployID, CityID, ProductID, CatalogID, CostoEnvio, TiempoEntrega)
(
    SELECT DISTINCT TempDelivery.EntregaID, Time.id, Client.id, Employ.id, City.id, Product.id, Catalog.id, TempDelivery.CostoEnvio, TempDelivery.TiempoEntrega
    FROM TempDelivery
    INNER JOIN Time ON TempDelivery.Dia = Time.Dia AND TempDelivery.Mes = Time.Mes AND TempDelivery.Anio = Time.Anio
    INNER JOIN Client ON TempDelivery.NombreCliente = Client.NombreCliente AND TempDelivery.Direccion = Client.Direccion
    INNER JOIN Employ ON TempDelivery.NombreEmpleadoEntrega = Employ.NombreEmpleadoEntrega AND TempDelivery.PuestoEmpleadoEntrega = Employ.PuestoEmpleadoEntrega
    INNER JOIN City ON TempDelivery.ciudadEntrega = City.ciudadEntrega
    INNER JOIN Product ON TempDelivery.NombreProducto = Product.NombreProducto AND TempDelivery.Descripcion = Product.Descripcion AND TempDelivery.Peso = Product.Peso AND TempDelivery.PrecioProducto = Product.PrecioProducto
    INNER JOIN Catalog ON TempDelivery.EstadoEntrega = Catalog.EstadoEntrega
)
GO