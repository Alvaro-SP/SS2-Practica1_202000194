USE [Practica1ETL]
GO
BULK INSERT TempDelivery FROM 'C:\Users\socop\Videos\REPOS TEMP\SS2-Practica1_202000194\ETL\EntregasUSAC-Delivery-Limpiado.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
)
GO
SELECT * FROM TempDelivery