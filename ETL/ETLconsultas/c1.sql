--! SELECT COUNT(*) de todas las tablas para ver que si realizo la carga en las tablas del modelo.
USE [Practica1ETL]
GO
SELECT
    'Delivery' AS Nombre_de_Tabla,
    COUNT(*) AS COUNT
FROM Delivery
UNION ALL
SELECT
    'Product' AS Nombre_de_Tabla,
    COUNT(*) AS COUNT
FROM Product
UNION ALL
SELECT
    'City' AS Nombre_de_Tabla,
    COUNT(*) AS COUNT
FROM City
UNION ALL
SELECT
    'Catalog' AS Nombre_de_Tabla,
    COUNT(*) AS COUNT
FROM Catalog
UNION ALL
SELECT
    'Time' AS Nombre_de_Tabla,
    COUNT(*) AS COUNT
FROM Time
UNION ALL
SELECT
    'Client' AS Nombre_de_Tabla,
    COUNT(*) AS COUNT
FROM Client
UNION ALL
SELECT
    'Empoy' AS Nombre_de_Tabla,
    COUNT(*) AS COUNT
FROM Employ;
