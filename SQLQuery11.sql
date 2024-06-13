USE [MunicipalidadTP]
GO
/****** Object:  StoredProcedure [dbo].[InsertarPago]    Script Date: 13/06/2024 12:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertarPago]
    @Id_cuota INT,
    @Fecha_pago DATE,
    @Monto_pagado DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Pagos (Id_cuota, Fecha_pago, Monto_pagado)
    VALUES (@Id_cuota, @Fecha_pago, @Monto_pagado);
END;
/*NECESITA UN ID DE CUOTA VALIDO 

EXEC InsertarPago 12,'10/04/2024', 587
SELECT * FROM Pagos*/

SELECT * FROM Propietario P
JOIN BienPropietario BP ON BP.Id_Propietario = P.IDPropietario
JOIN Bien B ON B.Idbien = BP.Id_Bien
JOIN Pagos PP ON PP.Id_Pago = P



