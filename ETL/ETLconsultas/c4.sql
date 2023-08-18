-- ! Top 5 de ciudades con más entregas
SELECT TOP 5
    c.ciudadEntrega AS Ciudad,
    COUNT(d.EntregaID) AS TotalEntregas
FROM
    Delivery d
INNER JOIN
    City c ON d.CityID = c.id
GROUP BY
    c.ciudadEntrega
ORDER BY
    TotalEntregas DESC;
