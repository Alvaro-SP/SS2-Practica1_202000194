--! Top 5 de envíos con estado Pendiente
USE [Practica1ETL]
GO
SELECT TOP 5
    p.NombreProducto,
    COUNT(d.ProductID) AS TotalEnviosPendientes
FROM
    Delivery d
INNER JOIN
    Catalog c ON d.CatalogID = c.id
INNER JOIN
    Product p ON d.ProductID = p.id
WHERE
    c.EstadoEntrega = 'Pendiente'
GROUP BY
    p.NombreProducto
ORDER BY
    TotalEnviosPendientes DESC;

--* top 5 de envios o entregas con estado pendiente (guiarse en los costos)