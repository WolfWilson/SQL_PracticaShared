USE [MunicipalidadTP]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCuotasImpagas]    Script Date: 13/06/2024 12:31:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ConsultarCuotasImpagas]
AS
BEGIN
    SELECT 
        c.Idcuota, 
        c.Id_bien, 
        c.Monto, 
        c.Fecha_vencimiento, 
        c.CodEstado, 
        e.Descripcion AS EstadoDescripcion 
    FROM 
        Cuota c
    JOIN 
        CDCuotaestado e ON c.CodEstado = e.Id_estado
    WHERE 
        e.Id_estado = 2; --impaga
END;

--exec ConsultarCuotasImpagas