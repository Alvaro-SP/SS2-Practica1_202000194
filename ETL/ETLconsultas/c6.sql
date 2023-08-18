-- !  Top 5 de envíos con estado Entregado

SELECT TOP 5
    d.EntregaID,
    p.NombreProducto,
    COUNT(d.ProductID) AS TotalEnviosPendientes
FROM
    Delivery d
INNER JOIN
    Catalog c ON d.CatalogID = c.id
INNER JOIN
    Product p ON d.ProductID = p.id
WHERE
    c.EstadoEntrega = 'Entregado'
GROUP BY
    p.NombreProducto
ORDER BY
    TotalEnviosPendientes DESC;
