
--! Top 5 de productos con el costo de envío más alto.
SELECT TOP 5
    p.NombreProducto,
    d.CostoEnvio
FROM
    Delivery d
INNER JOIN
    Product p ON d.ProductID = p.id
ORDER BY
    d.CostoEnvio DESC;
