-- !  Top 5 de envíos con estado Entregado

SELECT TOP 5
    d.EntregaID,
    c.EstadoEntrega AS Estado
FROM
    Delivery d
INNER JOIN
    Catalog c ON d.CatalogID = c.id
WHERE
    c.EstadoEntrega = 'Entregado'
ORDER BY
    d.EntregaID;
