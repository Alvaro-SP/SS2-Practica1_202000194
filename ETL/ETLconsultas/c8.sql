--! Total de Entregas por días de la semana

SELECT
    t.Dia AS Dia_Semana,
    COUNT(d.EntregaID) AS Total_Entregas
FROM
    Delivery d
INNER JOIN
    Time t ON d.TimeID = t.id
GROUP BY
    t.Dia
ORDER BY
    Total_Entregas DESC;
