-- !Total de Entregas por mes

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
