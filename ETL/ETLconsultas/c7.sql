--! Total de entregas realizadas por ciudad.

SELECT
    c.ciudadEntrega AS Ciudad,
    COUNT(d.EntregaID) AS Total_Entregas
FROM
    Delivery d
INNER JOIN
    City c ON d.CityID = c.id
GROUP BY
    c.ciudadEntrega
ORDER BY
    Total_Entregas DESC;
