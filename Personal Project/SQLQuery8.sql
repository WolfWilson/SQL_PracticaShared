USE [MunicipalidadTP]
GO
/****** Object:  StoredProcedure [dbo].[InsertarCuota]    Script Date: 13/06/2024 12:47:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertarCuota]
    @Id_bien INT,
    @Monto DECIMAL(10, 2),
    @Fecha_vencimiento DATE,
    @CodEstado INT
AS
BEGIN
    INSERT INTO Cuota (Id_bien, Monto, Fecha_vencimiento, CodEstado)
    VALUES (@Id_bien, @Monto, @Fecha_vencimiento, @CodEstado);--SERIA 1-PAGADO- SIEMPRE QUE SE CARGUE UN PAGO DE CUOTA
END;
/*

EXEC InsertarCuota 18, 587, '10/02/2024',2
select * from Cuota*/