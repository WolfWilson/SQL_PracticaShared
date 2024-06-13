SELECT TOP (1000) [Idbien]
      ,[Tipo]
      ,[Direccion]
      ,[Superficie]
      ,[Nomenclatura_catastral]
      ,[Marca]
      ,[Modelo]
      ,[Anio]
      ,[Patente]
  FROM [MunicipalidadTP].[dbo].[Bien]

  -- Insertar 10 registros en la tabla Cuota
INSERT INTO Cuota (Id_bien, Monto, Fecha_vencimiento, CodEstado)
VALUES 
(18, 1000.00, '2023-01-10', 2),
(19, 1500.50, '2023-02-15', 2),
(20, 1200.75, '2023-03-20', 2),
(21, 1800.00, '2023-04-25', 2),
(22, 1300.25, '2023-05-30', 2),
(23, 1100.50, '2023-06-10', 2),
(24, 1600.75, '2023-07-15', 2),
(25, 1400.00, '2023-08-20', 2),
(26, 1700.25, '2023-09-25', 2),
(27, 1900.50, '2023-10-30', 2);
GO

-- Insertar 10 registros en la tabla Pagos
INSERT INTO Pagos (Id_cuota, Fecha_pago, Monto_pagado)
VALUES 
(2, '2023-01-11', 1000.00),
(3, '2023-02-16', 1500.50),
(4, '2023-03-21', 1200.75),
(5, '2023-04-26', 1800.00),
(6, '2023-05-31', 1300.25),
(7, '2023-06-11', 1100.50),
(8, '2023-07-16', 1600.75),
(9, '2023-08-21', 1400.00),
(10, '2023-09-26', 1700.25),
(11, '2023-10-31', 1900.50);
GO
