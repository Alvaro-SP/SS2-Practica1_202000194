-- !Total de Entregas por año
USE [Practica1ETL]
GO
SELECT
    t.Anio AS Anio,
    COUNT(d.EntregaID) AS Total_Entregas
FROM
    Delivery d
INNER JOIN
    Time t ON d.TimeID = t.id
GROUP BY
    t.Anio
ORDER BY
    Total_Entregas DESC;
