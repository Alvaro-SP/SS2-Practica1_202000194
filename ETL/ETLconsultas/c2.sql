--! Top 5 Clientes con más entregas realizadas
USE [Practica1ETL]
GO
USE [Practica1ETL]
GO
SELECT TOP 5
    c.NombreCliente,
    COUNT(d.EntregaID) AS TotalEntregas
FROM
    Client c
JOIN
    Delivery d ON c.id = d.ClientID
GROUP BY
    c.NombreCliente
ORDER BY
    TotalEntregas DESC;