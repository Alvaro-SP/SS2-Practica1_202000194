-- !Total de Entregas por mes
USE [Practica1ETL]
GO
SELECT
    t.Mes AS Mes,
    COUNT(d.EntregaID) AS Total_Entregas
FROM
    Delivery d
INNER JOIN
    Time t ON d.TimeID = t.id
GROUP BY
    t.Mes
ORDER BY
    Total_Entregas DESC;
